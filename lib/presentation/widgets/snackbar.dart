import 'package:flutter/material.dart';

showSnackBar(String title, {bool? isError, Color? color, int milliseconds = 1800}) {
  SnackBar(
    content: Text(title),
  );
}
