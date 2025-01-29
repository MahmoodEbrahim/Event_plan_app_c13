import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myprovider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  void changetheme(){
    if(themeMode==ThemeMode.light){
      themeMode=ThemeMode.dark;
    }else{
      themeMode=ThemeMode.light;
    }
    notifyListeners();
  }

}