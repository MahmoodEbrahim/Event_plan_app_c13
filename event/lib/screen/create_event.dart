import 'package:event/Provider/create_event_provider.dart';
import 'package:event/firebase/firebase_manger.dart';
import 'package:event/model/task_model.dart';
import 'package:event/widget/category_event_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:provider/provider.dart';

class CreateEvent extends StatelessWidget {
  static const String routeName="createevent";

   CreateEvent({super.key});
   var titlecontroller=TextEditingController();
  var desccontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CreateEventProvider(),
      builder: (context,child){
        var provder=Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
                color: Theme.of(context).primaryColor
            ),
            title: Text("Create Event",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColor
            ),
            ),
          ),
          body: Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset("assets/images/${provder.EventCatogery[provder.selectCatogery]}.png",height: 220,fit: BoxFit.fill,),
              
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context,index)=>SizedBox(width: 18,),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            provder.changecatogery(index);
                          },
                          child: CategoryEventItem(text: provder.EventCatogery[index], isSelected: provder.selectCatogery==index),
              
                        );
                      },
                      itemCount: provder.EventCatogery.length,
                    ),
                  ),
                  SizedBox(height: 24,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Title",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 12,),
                      TextField(
                        controller: titlecontroller,
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).focusColor,
                        ),
                        decoration: InputDecoration(
              
                          labelText: "Event Title",
                          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).focusColor,
                          ),
                          prefixIcon: Icon(Icons.note_add_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).focusColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).focusColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Theme.of(context).focusColor,
              
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 12,),
              
                      TextField(
                        controller: desccontroller,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).focusColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Event Description",
                          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).focusColor,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).focusColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).focusColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).focusColor,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding: EdgeInsets.only(top: 25, left: 20),
                        ),
                        maxLines: 5,
                      ),
                      SizedBox(height: 24,),
                      Row(
                        children: [
                          Icon(MdiIcons.databaseEdit),
                          SizedBox(width: 12,),
                          Text("Event Date",style: Theme.of(context).textTheme.titleSmall,),
                          Spacer(),
                          InkWell(
                            onTap: ()async{
                              
                             var choosedate = await showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now().subtract(Duration(days:356)),
                                  lastDate: DateTime.now().add(Duration(days:356)));
                            },
                            child: Text(provder.selecteddate.toString().substring(0,10),style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).primaryColor
                            ),),
                          )
                        ],
                      ),
                      SizedBox(height: 24,),
                      Row(
                        children: [
                          Icon(MdiIcons.clock),
                          SizedBox(width: 12,),
                          Text("Event Time",style: Theme.of(context).textTheme.titleSmall,),
                          Spacer(),
                          InkWell(
                            onTap: (){},
                            child: Text("Choose Time",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Theme.of(context).primaryColor
                            ),),
                          )
                        ],
                      ),
                      SizedBox(height: 24,),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 26, horizontal: 40),
                            backgroundColor: Color(0xff5669FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                           TaskModel task= TaskModel(userid: FirebaseAuth.instance.currentUser!.uid,category: provder.EventCatogery[provder.selectCatogery], desc: desccontroller.text, isDone: false, date: provder.selecteddate.millisecondsSinceEpoch, title: titlecontroller.text,);
                            FirebaseManger.addEvent(task).then((value){
                              Navigator.pop(context);
                           },);
                          },
                          child: Text("Add Event",style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),

                    ],
                  )
              
              
                ],
              ),
            ),
            
            
          ),
          

        );
      },

    );
  }
}
