import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class TextThemes{
  static const TextStyle quoteText = TextStyle(
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.white,
  );

  static const TextStyle authorText = TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white
  );
}