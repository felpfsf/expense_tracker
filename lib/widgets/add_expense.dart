import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/shared/expt_text.dart';
import 'package:expense_tracker/widgets/shared/expt_text_field.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;

  const AddExpense({
    super.key,
    required this.onAddExpense,
  });

  @override
  State<AddExpense> createState() => _AddExpense();
}

class _AddExpense extends State<AddExpense> {
  final _titleController = TextEditingController(text: '');
  final _costController = TextEditingController(text: '');
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _handleSaveExpense() {
    final enteredCost = double.tryParse(_costController.text);
    final isCostInvalid = enteredCost == null || enteredCost <= 0;

    if (_titleController.text.trim().isEmpty ||
        isCostInvalid ||
        _selectedDate == null) {
      // error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const ExptText(
            text: 'Invalid input',
            fontSize: 20,
            color: Colors.redAccent,
            fontWeight: FontWeight.w600,
          ),
          content: const ExptText(
            text: 'Please make sure to fill all inputs.',
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        cost: enteredCost,
        category: _selectedCategory,
        createdAt: _selectedDate!,
      ),
    );

    debugPrint(
        'title => ${_titleController.text} \n cost => $enteredCost \n createdAt => ${formatter.format(_selectedDate!)} \n selectedCategory => ${_selectedCategory.name}');

    _onCloseModal();
  }

  void _onCloseModal() {
    debugPrint('Close modal');
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
    // or use .then() after the showDatePicker()
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _handleSelectCategory(value) {
    if (value == null) return;
    setState(() {
      _selectedCategory = value;
    });
  }

  @override
  void dispose() {
    // clean memory from controllers, avoiding app crash
    _titleController.dispose();
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final kbSpace = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 64, 16, kbSpace + 16),
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
              textEditingController: _costController,
              labelText: 'Cost',
              hintText: 'Add a cost amount for the expense',
              prefixText: '\$ ',
              keyboardType: TextInputType.number,
              maxLength: 17,
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => _handleSelectCategory(value),
                ),
                const Spacer(),
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
                ElevatedButton(
                  onPressed: _onCloseModal,
                  child: const ExptText(
                    text: 'Cancel',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _handleSaveExpense,
                  icon: const Icon(Icons.save_outlined),
                  label: const ExptText(
                    text: 'Save',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
