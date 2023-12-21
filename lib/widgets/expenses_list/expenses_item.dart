import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/shared/expt_text.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  final Expense expense;

  const ExpensesItem(
    this.expense, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ExptText(text: expense.title),
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ExptText(text: '\$ ${expense.cost.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    ExptText(text: expense.formattedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
