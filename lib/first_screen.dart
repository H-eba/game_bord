import 'package:flutter/material.dart';
import 'package:game_bord/game_bord_screen.dart';
class Screen extends StatelessWidget {
  static String routeName='screen';
  String player1='';
  String player2='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('wehcome'),),
      body: Column(children: [
          TextField(
            onChanged: (text){
              player1=text;
            },
              decoration: InputDecoration(
                hintText: 'player 1 name'
              ),
          )
           ,SizedBox(height: 5,),
        TextField(
          onChanged: (text){
            player2=text;
          },
          decoration: InputDecoration(
              hintText: 'player 2 name'
          ),
        ),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context,GameBordScreen.routeName,
              arguments: GameBordScreenArgument(player1,player2) );
        }, child: Text('start'))
      ],),
    );
  }
}
class GameBordScreenArgument{
  String p1;
  String p2;
  GameBordScreenArgument(this.p1,this.p2);
}