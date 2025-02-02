

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/model/task_model.dart';
import 'package:event/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManger{

static CollectionReference<TaskModel> getcolection(){
  return
    FirebaseFirestore.instance.collection("TaskOne").withConverter<TaskModel>(fromFirestore: (snapshot,_){
      return TaskModel.fromJson(snapshot.data()!);

    }, toFirestore: (model,_){
      return model.toJson();

    },
    );
}
static CollectionReference<UserModel> getusercolection(){
  return
    FirebaseFirestore.instance.collection("Users").withConverter<UserModel>(fromFirestore: (snapshot,_){
      return UserModel.fromJson(snapshot.data()!);

    }, toFirestore: (model,_){
      return model.toJson();

    },
    );
}

  static Future<void> addEvent(TaskModel task){
  var colection=getcolection();
  var docref =colection.doc();
  task.id=docref.id;
return docref.set(task);
  }

static Future<void> adduser(UserModel user){
  var colection=getusercolection();
  var docref =colection.doc(user.id);
  return docref.set(user);
}
 static Stream<QuerySnapshot<TaskModel>> getEvent(String categoryname){
    var colection=getcolection();
    if(categoryname=="All"){
      return colection.where("userid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();

    }else{
      return colection.where("userid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("Category",isEqualTo: categoryname).orderBy("date,",descending: true)
          .snapshots();

    }
  }
  static Future<UserModel?> readuser() async{
    var colection=getusercolection();
    DocumentSnapshot<UserModel> docref =
    await colection.doc(FirebaseAuth.instance.currentUser!.uid).get();
     return docref.data();

  }
  static Future<void> delete(String id){
    var colection=getcolection();
return colection.doc(id).delete();
  }
  static createAcc(String name,String emailAddress,String password,Function onloding,Function onsuccess,Function onerror) async{

    try {
      onloding();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user!.sendEmailVerification();
      UserModel userModel=UserModel(id: credential.user!.uid, name: name, email: emailAddress, createdAt: DateTime.now().millisecondsSinceEpoch);
      adduser(userModel);onsuccess();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onerror(e.message);
      } else if (e.code == 'email-already-in-use') {
        onerror(e.message);

      }
    } catch (e) {
      onerror("Somthing went Wrong");

      print(e);
    }
  }
  static login(String emailAddress,String password,Function onloding,Function onsuccess,Function onerror) async{
    try {
      onloding();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      onsuccess();
    } on FirebaseAuthException catch (e) {
      onerror("Wrong password or email!");
      }
    }
static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

}
  }
