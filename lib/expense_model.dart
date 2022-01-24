import 'package:flutter/material.dart';

class ExpenseModel {
  final String name;
  final String date;
  final String amount;
  final String imagepath;
  final String payment;

  ExpenseModel(
      {@required this.name,
      @required this.date,
      @required this.amount,
      @required this.imagepath,
      @required this.payment});
}
