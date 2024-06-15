import 'package:flutter/material.dart';

const heightGap = SizedBox(height: 20);

InputDecoration defaultInputDecoration({
  required String label,
}) {
  return InputDecoration(
    label: Text(label),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
  );
}

ElevatedButton defaultSubmitButton({
  required VoidCallback callbackFunction,
  required String buttonText,
}) {
  return ElevatedButton(
    onPressed: () {
      callbackFunction.call();
    },
    child: Text(
      buttonText.toUpperCase(),
    ),
  );
}
