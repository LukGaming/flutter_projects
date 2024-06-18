import 'package:flutter/material.dart';

Color chatBackgroundColor = Colors.pink[200]!;

Color textColor = const Color(0xFF616161);

Color rightContainerColor = const Color(0xFFD1C4E9);

Color rightContainerTextColor = const Color(0xFF512DA8);

Color leftContainerColor = const Color(0xFFBBDEFB);

Color leftContainerTextColor = const Color(0xFF0D47A1);

Color textFieldBackgroundColor = const Color.fromARGB(255, 123, 165, 126);

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: chatBackgroundColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: textColor),
    bodyMedium: TextStyle(
      color: textColor,
    ),
  ),
);
