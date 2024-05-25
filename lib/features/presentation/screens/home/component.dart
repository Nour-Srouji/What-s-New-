import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.red,
  bool isUpperCase = true,
  double radius = 3,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
