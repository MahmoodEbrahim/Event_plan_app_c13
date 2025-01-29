import 'package:flutter/material.dart';

class Forgetpassscreen extends StatelessWidget {
  static const String routeName="Forgetpassscreen";

  const Forgetpassscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password",style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/forgetpass.png",height: 360,width: 360,fit: BoxFit.cover,),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){},
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
                child:Text("Reset Password")
                


            ),
          ],
        ),
      ),
    );
  }
}
