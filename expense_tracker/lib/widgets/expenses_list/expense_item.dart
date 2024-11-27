import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category], color: theme.colorScheme.onPrimary,),
                    const SizedBox(width: 8),
                    Text(
                      expense.formattedDate,
                      style: theme.textTheme.bodyLarge,
                    )
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
