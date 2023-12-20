import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/shared/expt_text.dart';
import 'package:expense_tracker/widgets/shared/expt_text_field.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpense();
}

class _AddExpense extends State<AddExpense> {
  final TextEditingController _titleController =
      TextEditingController(text: '');

  final TextEditingController _amountController =
      TextEditingController(text: '');

  DateTime? _selectedDate;

  void _handleSaveExpense() {
    debugPrint(
        'title => ${_titleController.text} \n cost => ${_amountController.text} \n createdAt => ${formatter.format(_selectedDate!)}');
  }

  void _handleCancelExpense() {
    debugPrint('Cancel expense and close modal');
    Navigator.pop(context);
  }

  void _handleDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    // or use .the() after the showDatePicker()
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    // clean memory from controllers, avoiding app crash
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const ExptText(
            text: 'Add Expense',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          ExptTextField(
            textEditingController: _titleController,
            labelText: 'Title',
            hintText: 'Add a title for the expense',
          ),
          ExptTextField(
            textEditingController: _amountController,
            labelText: 'Cost',
            hintText: 'Add a cost amount for the expense',
            prefixText: '\$ ',
            keyboardType: TextInputType.number,
            maxLength: 17,
          ),
          Row(
            children: [
              ExptText(
                text: _selectedDate != null
                    ? formatter.format(_selectedDate!)
                    : 'No date selected',
              ),
              IconButton(
                onPressed: _handleDatePicker,
                icon: const Icon(Icons.calendar_month_outlined),
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton.icon(
                onPressed: _handleCancelExpense,
                icon: const Icon(Icons.cancel_outlined),
                label: const ExptText(text: 'Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: _handleSaveExpense,
                icon: const Icon(Icons.save_outlined),
                label: const ExptText(text: 'Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
