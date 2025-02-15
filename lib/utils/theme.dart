import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

const arLang = 'Arabic 🇸🇦';
const enLang = 'English 🇬🇧';
const frLang = 'Frensh 🇫🇷';

//fonts
const fontQuicksand = "Quicksand";

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.black,
        fontFamily: 'Quicksand',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    scaffoldBackgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Quicksand',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

