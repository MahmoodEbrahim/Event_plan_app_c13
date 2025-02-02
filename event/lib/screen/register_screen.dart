import 'package:easy_localization/easy_localization.dart';
import 'package:event/firebase/firebase_manger.dart';
import 'package:event/screen/login_screen.dart';
import 'package:event/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toggle_switch/toggle_switch.dart';



class registerscreen extends StatelessWidget {
  static const String routeName="registerscreen";
  registerscreen({super.key});
   var emailController=TextEditingController();
  var paswordController=TextEditingController();
  var userController=TextEditingController();
  var repassController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    var formkey=GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Register",style: Theme.of(context).textTheme.titleMedium,),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/Logo.png",height: 150,width: 152,),
              SizedBox(height: 16),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "name is required";
                  }
                  else{
                    return null;
                  }
                },
                controller: userController,
                style:Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).focusColor,
                ),
                decoration: InputDecoration(
          
                  labelText: "User",
                  labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).focusColor,
                  ),
                  prefixIcon: Icon(Icons.face),
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
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Email is required";
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if(emailValid==false){
                    return "Email not valid";
                  }

                    return null;

                },
                controller: emailController,
                style:Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).focusColor,
                ),
                decoration: InputDecoration(
          
                  labelText: "Email",
                  labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).focusColor,
                  ),
                  prefixIcon: Icon(MdiIcons.email),
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
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Password is required";
                  }
                  if(value.length<6){
                    return "password it week";
                  }

                  return null;

                },
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
          
          
              SizedBox(height: 16,),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "re Password is required";
                  }
                  if(value.length<6){
                    return "password it week";
                  }
                  if(paswordController.text!=value){
                    return "password it does not match";
                  }

                  return null;

                },
                controller: repassController,
                obscureText: true,
                style:Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).focusColor,
                ),
                decoration: InputDecoration(
          
                  labelText: "Re Password",
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
          
          
          
              SizedBox(height: 16,),
              SizedBox(height: 16,),
          
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {
                  if(formkey.currentState!.validate()){
                    FirebaseManger.createAcc(userController.text,emailController.text,paswordController.text
                    ,(){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Center(
                          child: CircularProgressIndicator()),
                        backgroundColor: Colors.transparent,
                      ));
                      },
                        (){
                      Navigator.pop(context);
                      Navigator.pop(context);

                        },
                  (message){
                    Navigator.pop(context);

                    showDialog(context: context, builder: (context)=>AlertDialog(
                    title: Text("Something went Wrong"),
                    content: Text(message),

                    actions: [ElevatedButton(onPressed: (){
                      Navigator.pop(context);

                    }, child: Text("Done"))],

                    backgroundColor: Colors.transparent,
                  ));},

                  );

                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Color(0xff5669FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Create Account",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Color(0xffFFFFFF)),
                ),
              ),
          
              SizedBox(height: 16,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, loginscreen.routeName);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
          
                      children: [
                        TextSpan(text: "Already Have Account ?",style: Theme.of(context).textTheme.titleSmall,),
                        TextSpan(text: "Login",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        ),
                      ]
                  ),),
              ),
              SizedBox(height: 16,),
          
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
      ),
    );
  }
}
