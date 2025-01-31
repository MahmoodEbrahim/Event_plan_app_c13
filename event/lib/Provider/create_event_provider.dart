import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CreateEventProvider extends ChangeNotifier{
  List<String> EventCatogery=[
    'birthday','holiday','game','work','meeting','book1','sport','Exhibition','eating'
  ];
  int selectCatogery=0;
  changecatogery(int index){
    selectCatogery=index;
    notifyListeners();
  }
}