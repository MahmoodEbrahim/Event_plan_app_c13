import 'package:event/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Darktheme extends baseTheme {
  Color get bgcolor => Color(0xff101127);
  Color get primarycolor => Color(0xff5669FF);
  Color get textcolor => Color(0xffF4EBDC);
  ThemeData get Themedata => ThemeData(
        scaffoldBackgroundColor: bgcolor,
    focusColor: primarycolor,

    appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: primarycolor,
          ),
        ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 4,
            color: Colors.white,
          )
      ),
      backgroundColor: primarycolor,

    ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: bgcolor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
        textTheme: TextTheme(
          titleMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
