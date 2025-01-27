import 'package:event/firstScreen.dart';
import 'package:event/theme/darktheme.dart';
import 'package:event/theme/lighttheme.dart';
import 'package:event/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    baseTheme theme = Lighttheme();
    baseTheme darktheme = Darktheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Firstscreen.routeName,
      darkTheme: darktheme.Themedata,
      theme: theme.Themedata,
      themeMode: ThemeMode.light,
      routes: {
        Firstscreen.routeName: (context) => Firstscreen(),
      },
    );
  }
}
