import 'package:easy_localization/easy_localization.dart';
import 'package:event/Provider/my_provider.dart';
import 'package:event/Provider/user_provider.dart';
import 'package:event/firebase/firebase_manger.dart';
import 'package:event/firebase_options.dart';
import 'package:event/screen/Homescreen.dart';
import 'package:event/screen/create_event.dart';
import 'package:event/screen/firstScreen.dart';
import 'package:event/screen/forgetpassscreen.dart';
import 'package:event/screen/login_screen.dart';
import 'package:event/screen/register_screen.dart';
import 'package:event/theme/darktheme.dart';
import 'package:event/theme/lighttheme.dart';
import 'package:event/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/user_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(
    
         MultiProvider(
           providers: [
             ChangeNotifierProvider(create: (context)=>myprovider()),
             ChangeNotifierProvider(create: (context)=>userprovider()),
           ],
           child: EasyLocalization
              (
                   supportedLocales: [Locale('en'), Locale('ar')],
                   path: 'assets/translations', // <-- change the path of the translation files
                   fallbackLocale: Locale('en', 'US'),
                   child: MyApp()),
         ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myprovider>(context);
    var userProvider=Provider.of<userprovider>(context);

    baseTheme theme = Lighttheme();
    baseTheme darktheme = Darktheme();

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute:userProvider.firebaseUser!=null?Homescreen.routeName:Firstscreen.routeName,

      darkTheme: darktheme.Themedata,
      theme: theme.Themedata,
      themeMode: provider.themeMode,
      routes: {
        Firstscreen.routeName: (context) => Firstscreen(),
        loginscreen.routeName: (context)=> loginscreen(),
        registerscreen.routeName: (context)=> registerscreen(),
        Forgetpassscreen.routeName: (context)=> Forgetpassscreen(),
        Homescreen.routeName:(context)=>Homescreen(),
        CreateEvent.routeName:(context)=>CreateEvent()
      },
    );
  }
}
