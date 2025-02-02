import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/firebase/firebase_manger.dart';
import 'package:event/tabs/hometab/eventitem.dart';
import 'package:flutter/material.dart';

import '../../model/task_model.dart';


class HomeTab extends StatefulWidget {
   HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
   List<String> EventCatogery=[
     'All','birthday','holiday','game','work','meeting','book1','sport','Exhibition','eating'
   ];

   int selectcategeroy=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: false,
        leading: SizedBox(),
        leadingWidth: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back ✨",style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),),
            Text("John Safwat",style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontSize: 24,
            ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.wb_sunny_outlined,color: Colors.white,),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,borderRadius: BorderRadius.circular(8),
            ),
            child: Text("EN",style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
            ),
          ),
        ],
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        bottom: AppBar(
          shape: const OutlineInputBorder(
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),
    ),
              borderSide: BorderSide(color: Colors.transparent)
          ),
          leading: SizedBox(),
          centerTitle: false,
          leadingWidth: 0,
          backgroundColor:  Theme.of(context).primaryColor,
          title: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.local_library_outlined,color: Colors.white,),
                  SizedBox(width: 4,),
                  Text("Cairo , Egypt",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white
                  )),
                ],
              ),
              SizedBox(height: 9,),
              Container(
                alignment: Alignment.center,
                height: 40,
                child: ListView.separated(
                  separatorBuilder: (context,index)=>
                    SizedBox(width: 8,),

                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          selectcategeroy=index;
                          setState(() {

                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(

                            color: selectcategeroy!=index? Theme.of(context).primaryColor: Colors.white,
                            border: Border.all(
                              color: Colors.white
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(EventCatogery[index],style: Theme.of(context).textTheme.titleMedium!.copyWith(
                             color: selectcategeroy==index? Theme.of(context).primaryColor: Colors.white,
                          ),),
                        ),
                      );
                    },
                    itemCount: EventCatogery.length),
              )
            ],
          ),
        ),



      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream: FirebaseManger.getEvent(EventCatogery[selectcategeroy]),
        builder: (context,snapshot){
          return  Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              separatorBuilder: (context,i)=>SizedBox(height: 24,),
              itemBuilder: (context, index){
                return Eventitem(model:snapshot.data!.docs[index].data() ,);


              },itemCount: snapshot.data?.docs.length??0,
            ),
          );

        },
      ),
    );
  }
}
