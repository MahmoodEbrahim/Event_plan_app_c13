import 'package:event/tabs/hometab/eventitem.dart';
import 'package:flutter/material.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
              Container(
                height: 40,
                color: Colors.cyan,
              )
            ],
          ),
        ),



      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
        separatorBuilder: (context,i)=>SizedBox(height: 24,),
          itemBuilder: (context, index){
          return Eventitem();


        },itemCount: 9,
        ),
      ),
    );
  }
}
