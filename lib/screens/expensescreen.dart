import 'package:expensetrackingapp/model/expensemodel.dart';
import 'package:expensetrackingapp/widgets/expenselist.dart';
import 'package:expensetrackingapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expensescreen extends StatefulWidget {
  const Expensescreen({super.key});

  @override
  State<Expensescreen> createState() => _ExpensescreenState();
}

class _ExpensescreenState extends State<Expensescreen> {
  void _addExpense(ExpenseModel expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    final expenseIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(label: 'Undo',onPressed:(){
          setState(() {
            expenses.insert(expenseIndex, expense);
          });
        }),
      ),
    );
  }

  // ignore: no_leading_underscores_for_local_identifiers
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(onAddExpense: _addExpense));
  }

  final List<ExpenseModel> expenses = [
    ExpenseModel(
        title: "Food",
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
    ExpenseModel(
        title: "Travel",
        amount: 100,
        date: DateTime.now(),
        category: Category.travel),
  ];
  //double screenHeight = MediaQuery.of(context).size.height;
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("No expenses found"));
    if (expenses.isNotEmpty) {
      content =
          ExpenseList(expenses: expenses, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: _openAddExpenseOverlay,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart), label: "Chart"),
          ],
        ),
        body: Column(
          children: [Expanded(child: content)],
        ));
  }
}
