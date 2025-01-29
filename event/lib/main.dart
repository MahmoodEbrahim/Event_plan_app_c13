import 'package:easy_localization/easy_localization.dart';
import 'package:event/Provider/my_provider.dart';
import 'package:event/screen/firstScreen.dart';
import 'package:event/screen/forgetpassscreen.dart';
import 'package:event/screen/login_screen.dart';
import 'package:event/screen/register_screen.dart';
import 'package:event/theme/darktheme.dart';
import 'package:event/theme/lighttheme.dart';
import 'package:event/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    
      ChangeNotifierProvider(
        create: (context)=>myprovider(),
        child: EasyLocalization
            (
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myprovider>(context);
    baseTheme theme = Lighttheme();
    baseTheme darktheme = Darktheme();

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: Firstscreen.routeName,
      darkTheme: darktheme.Themedata,
      theme: theme.Themedata,
      themeMode: provider.themeMode,
      routes: {
        Firstscreen.routeName: (context) => Firstscreen(),
        loginscreen.routeName: (context)=> loginscreen(),
        registerscreen.routeName: (context)=> registerscreen(),
        Forgetpassscreen.routeName: (context)=> Forgetpassscreen(),
      },
    );
  }
}
