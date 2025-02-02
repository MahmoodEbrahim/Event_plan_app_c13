import 'package:event/firebase/firebase_manger.dart';
import 'package:event/screen/firstScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
   ProfileTab({super.key});
   String selectedValue = "Language ";
   List<String> items = [" Arabic", " English",];

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
            ClipRRect(
              borderRadius: BorderRadius.circular(8), // يجعل الصورة بحواف دائرية
              child:
              Image.asset("assets/images/profile.png",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),

            Text("John Safwat",style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontSize: 24,
            ),
            ),
            SizedBox(width: 10),

            Text("johnsafwat.route@gmail.com",style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
            ),
          ],
        ),


    ),

      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Text("Language",style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 24,
            ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),

              ),
              child: PopupMenuButton<String>(
                onSelected: (String value) {
                  print("Language: $value");
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "Arabic",
                    child: Text("🇸🇦 Arabic"),
                  ),
                  PopupMenuItem<String>(
                    value: "English",
                    child: Text("🇺🇸 English"),
                  ),
                ],
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Text(
                      "Select Language",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            Text("Theme",style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.black,
              fontSize: 24,
            ),
            ),

            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),

              ),
              child: PopupMenuButton<String>(
                onSelected: (String value) {
                  print("Theme: $value");
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "Light",
                    child: Text("Light"),
                  ),
                  PopupMenuItem<String>(
                    value: "Dark",
                    child: Text("Dark"),
                  ),
                ],
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Text(
                      "Select Theme",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                    ),

                  ],
                ),
              ),

            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                FirebaseManger.logout();
                Navigator.pushNamedAndRemoveUntil(context, Firstscreen.routeName, (route)=>false);

              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 30),
                backgroundColor: Color(0xff5669FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                "Logout",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Color(0xffFFFFFF)),
              ),
            ),





          ],

        ),

      ),


    );
  }
}
