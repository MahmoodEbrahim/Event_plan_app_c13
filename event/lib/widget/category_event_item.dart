import 'package:flutter/material.dart';

class CategoryEventItem extends StatelessWidget {
  String text;
  bool isSelected;
   CategoryEventItem(
       {required this.text,required this.isSelected,
         super.key}
       );

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15),
          color:isSelected? Theme.of(context).primaryColor:Colors.transparent,
        ),
        child: Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color:isSelected? Colors.white:Theme.of(context).primaryColor,
        ),));
  }
}
