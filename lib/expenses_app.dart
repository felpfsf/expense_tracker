import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/add_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/shared/expt_text.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesApp();
}

class _ExpensesApp extends State<ExpensesApp> {
  // final List<Expense> _registeredExpenses = [
  //   Expense(
  //     title: 'Flutter Course',
  //     cost: 19.99,
  //     category: Category.work,
  //     createdAt: DateTime.now(),
  //   ),
  //   Expense(
  //     title: 'Oppenheimer',
  //     cost: 4.99,
  //     category: Category.leisure,
  //     createdAt: DateTime.now(),
  //   ),
  //   Expense(
  //     title: 'Dinner @ Fogo de Chão',
  //     cost: 234.45,
  //     category: Category.food,
  //     createdAt: DateTime.now(),
  //   ),
  //   Expense(
  //     title: 'Traveling',
  //     cost: 136.45,
  //     category: Category.travel,
  //     createdAt: DateTime.now(),
  //   ),
  // ];
  final List<Expense> _registeredExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) => AddExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget emptyState = const Center(
      child: ExptText(
        text: 'No expenses found. \n Start adding some !',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.center,
      ),
    );

    Widget mainContent = ExpensesList(
      expenses: _registeredExpenses,
      onDeleteExpense: _deleteExpense,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          const Text('Expenses Chart...'),
          // Since we are using column we need to add a expanded widget to display
          // the list
          Expanded(
            child: _registeredExpenses.isNotEmpty ? mainContent : emptyState,
          ),
        ],
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
