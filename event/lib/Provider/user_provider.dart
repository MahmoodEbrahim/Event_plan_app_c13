
import 'package:event/firebase/firebase_manger.dart';
import 'package:event/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class userprovider extends ChangeNotifier{
  UserModel? userModel;
  User? firebaseUser;

  userprovider(){
    firebaseUser=FirebaseAuth.instance.currentUser;

    if(firebaseUser!=null){

    }
  }
  inituser()  async{
userModel=await FirebaseManger.readuser();
notifyListeners();

  }
}