import 'package:flutter/material.dart';

class TextController {
  final TextEditingController? controller;
  final String? Function(String value) validator;

  TextController(this.controller, this.validator);
}
