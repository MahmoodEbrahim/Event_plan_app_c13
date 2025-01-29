import 'package:easy_localization/easy_localization.dart';
import 'package:event/screen/register_screen.dart';
import 'package:event/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'forgetpassscreen.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

class loginscreen extends StatelessWidget {
  static const String routeName="loginscreen";
   loginscreen({super.key});
   var emailController=TextEditingController();
  var paswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/Logo.png",height: 150,width: 152,),
            SizedBox(height: 12),
            TextField(
              controller: emailController,
              style:Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).focusColor,
              ),
              decoration: InputDecoration(

                labelText: "Email",
                labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).focusColor,
                ),
                prefixIcon: Icon(Icons.email_rounded),
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
            SizedBox(height: 16,),
            TextField(
              controller: paswordController,
              obscureText: true,
              style:Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).focusColor,
              ),
              decoration: InputDecoration(

                labelText: "Password",
                labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).focusColor,
                ),
                prefixIcon: Icon(MdiIcons.lock),
                suffixIcon: Icon(MdiIcons.eye),
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
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Forgetpassscreen.routeName);
                  },
                  child: Text("Forget Password?",style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),

            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Color(0xff5669FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Color(0xffFFFFFF)),
              ),
            ),
            SizedBox(height: 16,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, registerscreen.routeName);
              },

              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(

                children: [
                  TextSpan(text: "Don’t Have Account ?",style: Theme.of(context).textTheme.titleSmall,),
                  TextSpan(text: "Create Account",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                  ),
                ]
              ),),
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Expanded(child: Divider(height: 24,endIndent: 10,indent: 40,   thickness: 2     ,          color: Theme.of(context).primaryColor,
                ),),
                Text("OR" ,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),

                    ),
                Expanded(child: Divider(height: 24,endIndent: 40,indent: 10,thickness: 2    ,              color: Theme.of(context).primaryColor,
                ),),

              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _handleSignIn,
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Color(0xffF2FEFF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).primaryColor
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  ),
                child:
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/googleicon.png',
                      width: 30,
                      height: 26,
                    ),
                    SizedBox(width: 6,),
                    Text("Login With Google",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                )


            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ToggleSwitch(
                    minWidth: 73.0,
                    minHeight: 30.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: [
                      context.locale.toString()=="en"
                          ?FontAwesomeIcons.flagUsa
                          :MdiIcons.abjadArabic
                      ,
                      context.locale.toString()!="en"
                          ?FontAwesomeIcons.flagUsa
                          :MdiIcons.abjadArabic,




                    ],
                    iconSize: 50.0,

                    activeBgColors:
                    [
                      context.locale.toString()=="en"?

                      [Color(0xff5669FF), Color(0xff5669FF)]
                          :[Color(0xff5669FF), Color(0xff5669FF)]
                    ],
                    animate: true, // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves.bounceInOut, // animate must be set to true when using custom curve
                    onToggle: (index) {
                      if(context.locale.toString()=="en"){
                        if(index==0){
                          context.setLocale(Locale("en"));
                        }
                        else{
                          context.setLocale(Locale("ar"));

                        }

                      }else{
                        if(index==1){
                          context.setLocale(Locale("en"));
                        }
                        else{
                          context.setLocale(Locale("ar"));

                        }
                      }



                      print('switched to: $index');
                      print(context.locale.toString());

                    },
                  ),
                ),
              ],
            ),


          ],

        ),
      ),
    );
  }
}
Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}
