import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  leisure,
  travel,
  work,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining_outlined,
  Category.leisure: Icons.movie_outlined,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.work: Icons.work_outlined
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime createdAt;
  final Category category;

  String get formattedDate {
    return formatter.format(createdAt);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.createdAt,
  }) : id = uuid.v4();
}
