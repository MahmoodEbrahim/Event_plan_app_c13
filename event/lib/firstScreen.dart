import 'package:flutter/material.dart';

class Firstscreen extends StatelessWidget {
  static const String routeName = "FirstSreen";
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Let’s Start",
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
              "Personalize Your Experience",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Color(0xff1C1C1C)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Language",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Theme",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
