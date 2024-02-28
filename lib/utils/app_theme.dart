import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color.fromRGBO(23, 119, 242, 1);
const Color onPrimary = Colors.black;
const Color secondary = Colors.white;
const Color onSecondary = Colors.white;
const Color error = Colors.red;
const Color onError = Colors.redAccent;
const Color background = Color.fromARGB(255, 240, 240, 240);
const Color onBackground = Colors.white;
const Color surface = Color.fromRGBO(23, 160, 242, 1);
const Color onSurface = Colors.black;

const LinearGradient gradientColor = LinearGradient(begin: Alignment.topLeft,colors: [Colors.white,Colors.blue]);

final TextTheme textTheme = TextTheme(
  titleLarge: GoogleFonts.raleway(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.raleway(color: Colors.grey, fontSize: 20),
  titleSmall: GoogleFonts.raleway(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
  headlineMedium: GoogleFonts.raleway(color: Colors.black, fontSize: 16),
  displayMedium: GoogleFonts.raleway(color: Colors.grey, fontSize: 14),
  displaySmall: GoogleFonts.raleway(color: Colors.black, fontSize: 14),
);