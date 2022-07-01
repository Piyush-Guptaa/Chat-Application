import 'package:flutter/material.dart';

showSnackBar(context, String text, bool status) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        status
            ? const Icon(Icons.check_circle, color: Colors.white)
            : const Icon(Icons.error, color: Colors.white),
        const SizedBox(width: 10),
        Flexible(child: Text(text), flex: 1),
      ],
    ),
    backgroundColor: status ? Colors.green : Colors.red,
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
