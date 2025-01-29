import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Provider/my_provider.dart';

class Firstscreen extends StatelessWidget {
  static const String routeName = "FirstSreen";
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<myprovider>(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18, left: 15, right: 18),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Color(0xff5669FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          child: Text(
            "Lets_start".tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Color(0xffFFFFFF)),
          ),
        ),
      ),
      appBar: AppBar(
        title: Image.asset("assets/images/header1.png"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/body1.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "intro".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            Text(
              "body".tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Color(0xff1C1C1C)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lang".tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ToggleSwitch(
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
                  iconSize: 20.0,

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
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ToggleSwitch(
                  minWidth: 73.0,
                  minHeight: 30.0,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [
                    provider.themeMode==ThemeMode.light?

                    MdiIcons.weatherSunny:
                    FontAwesomeIcons.cloudMoon,
                    provider.themeMode!=ThemeMode.light?
                    MdiIcons.weatherSunny:
                    FontAwesomeIcons.cloudMoon,
                  ],
                  iconSize: 20.0,
                  activeBgColors:
                  [
                    provider.themeMode==ThemeMode.light?
                    [
                      Colors.amberAccent, Colors.amberAccent
                    ]: [Color(0xff5669FF), Color(0xff5669FF)],
                    provider.themeMode!=ThemeMode.light?
                    [
                      Colors.blueGrey, Colors.blueGrey
                    ]: [Colors.amberAccent, Colors.amberAccent]
                  ],

                  animate: true, // with just animate set to true, default curve = Curves.easeIn
                  curve: Curves.bounceInOut, // animate must be set to true when using custom curve
                  onToggle: (index) {
                    provider.changetheme();


                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
