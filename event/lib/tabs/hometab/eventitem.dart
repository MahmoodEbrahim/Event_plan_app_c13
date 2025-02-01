import 'package:easy_localization/easy_localization.dart';
import 'package:event/firebase/firebase_manger.dart';
import 'package:flutter/material.dart';

import '../../model/task_model.dart';

class Eventitem extends StatelessWidget {
  TaskModel model;

  Eventitem({required this.model,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset("assets/images/${model.category}.png")),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                margin: EdgeInsets.symmetric(horizontal: 8,vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18)
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                          },
                          child: Icon(Icons.favorite_border),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            FirebaseManger.delete(model.id);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),

              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: 14,
              top: 12,

            ),

            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            
            child: Column(
              children: [
                Text(
                  DateTime.fromMillisecondsSinceEpoch(model.date).toString().substring(8,10),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
                ),
                Text(MSTM(model.date),style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,),)

              ],
            ),
          )
        ],
      ),
    );
  }
}
String MSTM(int millisecond){
  DateTime date=DateTime.fromMillisecondsSinceEpoch(millisecond);
  return DateFormat('MMM').format(date);
}
