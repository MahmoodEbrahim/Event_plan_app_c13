import 'package:event/screen/create_event.dart';
import 'package:event/tabs/hometab/home_tab.dart';
import 'package:event/tabs/love_tab.dart';
import 'package:event/tabs/map_tab.dart';
import 'package:event/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class Homescreen extends StatefulWidget {
  static const String routeName="homescreen";


   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectIndex=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
Navigator.pushNamed(context, CreateEvent.routeName);
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      bottomNavigationBar: BottomNavigationBar(
onTap: (value){
  selectIndex=value;
  setState(() {

  });
},

        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled,),label: ""
        ),
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined),label: ""
        ),
        BottomNavigationBarItem(icon: Icon(Icons.heart_broken_outlined),label: ""
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: ""
        ),
      ],
      ),
      body: tabs[selectIndex],
    );
  }
  List<Widget> tabs=[
    HomeTab(),
    MapTab(),
    LoveTab(),
    ProfileTab(),

  ];
}
