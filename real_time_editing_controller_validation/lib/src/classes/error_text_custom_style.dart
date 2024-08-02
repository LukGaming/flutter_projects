// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomErrorTextStyle {
  int? maxLines;
  TextOverflow? textOverflow;
  TextStyle style;
  CustomErrorTextStyle({
    this.maxLines,
    this.textOverflow,
    required this.style,
  });
}
