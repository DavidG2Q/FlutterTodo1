import 'package:flutter/material.dart';

class AppStyles {
  static const primaryColor = Colors.teal;
  static const secondaryColor = Colors.orange;

  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle todoTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle completedTodoTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.lineThrough,
      color: Colors.grey);
}
