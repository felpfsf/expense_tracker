import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/shared/expt_text.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesApp();
}

class _ExpensesApp extends State<ExpensesApp> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      category: Category.work,
      createdAt: DateTime.now(),
    ),
    Expense(
      title: 'Oppenheimer',
      amount: 4.99,
      category: Category.leisure,
      createdAt: DateTime.now(),
    ),
    Expense(
      title: 'Dinner @ Fogo de Chão',
      amount: 234.45,
      category: Category.food,
      createdAt: DateTime.now(),
    ),
    Expense(
      title: 'Traveling',
      amount: 136.45,
      category: Category.travel,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: TitleSection(),
          ),
          toolbarHeight: 96,
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            const Text('Expenses Chart...'),
            // Since we are using column we need to add a expanded widget to display
            // the list
            Expanded(
              child: ExpensesList(expenses: _expenses),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Expense Tracker';

    return Row(
      children: [
        const ExptText(
          text: appTitle,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
