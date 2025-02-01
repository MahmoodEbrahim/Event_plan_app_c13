

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/model/task_model.dart';

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

  static Future<void> addEvent(TaskModel task){
  var colection=getcolection();
  var docref =colection.doc();
  task.id=docref.id;
return docref.set(task);
  }
 static Stream<QuerySnapshot<TaskModel>> getEvent(){
    var colection=getcolection();
return colection.snapshots();
  }
  static Future<void> delete(String id){
    var colection=getcolection();
return colection.doc(id).delete();
  }
}