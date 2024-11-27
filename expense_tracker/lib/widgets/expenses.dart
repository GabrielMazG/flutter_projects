import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils/texts.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: TextBigSecondary(text: 'No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const TextBigSecondary(text: 'Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < height
          ? Column(children: [
              Chart(expenses: _registeredExpenses),
              Expanded(child: mainContent),
            ])
          : Row(children: [
              Expanded(
                child: Chart(expenses: _registeredExpenses),
              ),
              Expanded(child: mainContent),
            ]),
    );
  }

  // Text('displayL', style: theme.textTheme.displayLarge),
  // Text('displayM', style: theme.textTheme.displayMedium),
  // Text('displayS', style: theme.textTheme.displaySmall),
  // Text('headlineL', style: theme.textTheme.headlineLarge),
  // Text('headlineM', style: theme.textTheme.headlineMedium),
  // Text('headlineS', style: theme.textTheme.headlineSmall),
  // Text('titleL', style: theme.textTheme.titleLarge),
  // Text('titleM', style: theme.textTheme.titleMedium),
  // Text('titleS', style: theme.textTheme.titleSmall),
  // Text('labelL', style: theme.textTheme.labelLarge),
  // Text('labelM', style: theme.textTheme.labelMedium),
  // Text('labelS', style: theme.textTheme.labelSmall),
  // Text('bodyL', style: theme.textTheme.bodyLarge),
  // Text('bodyM', style: theme.textTheme.bodyMedium),
  // Text('bodyS', style: theme.textTheme.bodySmall),

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const TextSmallPrimary(text: 'Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }
}
