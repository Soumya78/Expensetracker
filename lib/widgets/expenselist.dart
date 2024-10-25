import 'package:expensetrackingapp/model/expensemodel.dart';
import 'package:expensetrackingapp/widgets/expenseitem.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              key: UniqueKey(),
              child: ExpenseItem(expense: expenses[index]));
        });
  }
}
