import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

showSnackbar(
    {required BuildContext context, required String text, bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: (isErro) ? Colors.red : Colors.green,
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
