import 'package:app/main.dart';
import 'package:app/model/expense.dart';
import 'package:app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });
  final List<Expense> expenses;
  void Function(Expense expense) removeExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(color: globalTheme.error.withOpacity(0.75)),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
