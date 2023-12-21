import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onDeleteExpense;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDeleteExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
          color: Theme.of(context).colorScheme.error.withOpacity(.75),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.delete,
                  size: 32,
                  color: Colors.white,
                ),
                Text(
                  'Delete',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onDeleteExpense(expenses[index]);
        },
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
