import 'package:flutter/material.dart';

class Eventitem extends StatelessWidget {
  const Eventitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset("assets/images/game.png")),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                margin: EdgeInsets.symmetric(horizontal: 8,vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18)
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("This is a Game Party ",style: Theme.of(context).textTheme.titleSmall,),
                    Icon(Icons.favorite_border)
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: 14,
              top: 12,

            ),

            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            
            child: Column(
              children: [
                Text("20",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
                ),
                Text("NOV",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,),)

              ],
            ),
          )
        ],
      ),
    );
  }
}
