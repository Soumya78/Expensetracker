import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, shopping, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff,
  Category.shopping: Icons.shopping_bag,
  Category.work: Icons.work,
};

class ExpenseModel {
  final String title;
  final double amount;
  final DateTime date;
  final Category? category;
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category});

  String get formattedDate {
    return formatter.format(date);
  }
}
