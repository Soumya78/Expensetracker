import 'package:expensetrackingapp/model/expensemodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(ExpenseModel) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // ignore: non_constant_identifier_names
  // var titleInput = "";
  // void _saveExpenseData(String Inputdata) {
  //   titleInput = Inputdata;
  // }
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();
  Category? _selectedCategory = Category.food;
  @override
  void dispose() {
    titlecontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _showDatePicker() async {
    final pickeddate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    setState(() {
      _selectedDate = pickeddate;
    });
  }

  void _submitExpenseData() {
    final enterdamount = double.tryParse(amountcontroller.text);
    final amountisvalid = enterdamount == null || enterdamount <= 0;
    if (titlecontroller.text.trim().isEmpty ||
        amountisvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid input"),
                content: const Text(
                    "Please make sure you provide valid title, amount, and date"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
    widget.onAddExpense(ExpenseModel(
        title: titlecontroller.text,
        amount: enterdamount,
        date: _selectedDate!,
        category: _selectedCategory));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: titlecontroller,
            decoration: const InputDecoration(
              label: Text('title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? 'Select a date'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _showDatePicker,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name));
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              ElevatedButton(
                  onPressed: _submitExpenseData, child: const Text("Save")),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
            ],
          )
        ],
      ),
    );
  }
}
