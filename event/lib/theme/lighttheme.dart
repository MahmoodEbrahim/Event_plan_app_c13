import 'package:event/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Lighttheme extends baseTheme {
  Color get bgcolor => Color(0xffF2FEFF);
  Color get primarycolor => Color(0xff5669FF);
  Color get textcolor => Color(0xff1C1C1C);
  ThemeData get Themedata => ThemeData(
        scaffoldBackgroundColor: bgcolor,
        focusColor: Color(0xff7B7B7B),
        appBarTheme: AppBarTheme(

          backgroundColor: bgcolor,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: primarycolor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primarycolor,
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
