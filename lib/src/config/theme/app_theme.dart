import 'package:flutter/material.dart';
import 'package:flutter_dex_2/src/config/theme/text_theme.dart';

final ThemeData appTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: textTheme,
    appBarTheme: appBarTheme);

final AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: textTheme.displayLarge,
    foregroundColor: Colors.white);
