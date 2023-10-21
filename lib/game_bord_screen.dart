import 'package:flutter/material.dart';
import 'package:game_bord/first_screen.dart';
import 'package:game_bord/game_bord_button.dart';
class GameBordScreen extends StatefulWidget {
  static String routeName='game bord screen';
  @override
  State<GameBordScreen> createState() => _GameBordScreenState();

}
class _GameBordScreenState extends State<GameBordScreen> {
  String buttonState='x';
  List<String>bordState=[
    '','','',
    '','','',
    '','','',
  ];
  int player1Score=0;
  int player2Score=0;
  @override
  Widget build(BuildContext context) {
    GameBordScreenArgument args =ModalRoute.of(context)!.settings.arguments as GameBordScreenArgument;
    return Scaffold(
      appBar: AppBar(title: Text('X_O Game'),backgroundColor: Colors.deepPurple,),
      body: Column(children: [
        Expanded(child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('${args.p1}:$player1Score'
              , style: TextStyle(fontSize: 25),),
            Text('${args.p2}:$player2Score'
              , style: TextStyle(fontSize: 25),),
          ],
        )),

        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              GameBordButton(symbol: bordState[0],onClik: onButtonClick,index: 0,),
              GameBordButton(symbol: bordState[1],onClik: onButtonClick,index: 1,),
              GameBordButton(symbol: bordState[2],onClik: onButtonClick,index: 2,),


            ],),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameBordButton(symbol: bordState[3],onClik: onButtonClick,index: 3,),
              GameBordButton(symbol:bordState[4],onClik: onButtonClick,index: 4,),
              GameBordButton(symbol:bordState[5],onClik: onButtonClick,index: 5,),


            ],),
        ),

        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameBordButton(symbol:bordState[6],onClik: onButtonClick,index: 6,),
              GameBordButton(symbol: bordState[7],onClik: onButtonClick,index:7,),
              GameBordButton(symbol: bordState[8],onClik: onButtonClick,index:8,),

            ],),
        ),


      ],),
    );
  }
  int counter =0;
  void onButtonClick(int index){
    if (bordState[index].isNotEmpty)return;
    String symbol =counter%2==0?"o":"x";
    bordState[index]=symbol;
    setState(() {

    });
     ///player1 or player2
     if (checkWiner(symbol)){
       if (symbol=='o'){
         player1Score ++;
       }else{
         player2Score ++;
       }
       counter=0;
       bordState=[
         '','','',
         '','','',
         '','','',
       ];
       setState(() {

       });
       return;
     }


    ///drow
    if (counter==8){
      bordState=[
        '','','',
        '','','',
        '','','',
      ];counter=0;
      setState(() {

      });
      return;
    }
    counter++;

  }
  
   /// whose winer
  bool checkWiner(String symbol){
    if(bordState[0]==symbol&&bordState[4]==symbol&&bordState[8]==symbol){
      return true;}
    if(bordState[2]==symbol&&bordState[4]==symbol&&bordState[6]==symbol){
      return true;}

    for(int i=0;i<7;i+=3){
      if(bordState[i]==symbol&&bordState[i+1]==symbol&&bordState[i+3]==symbol){
        return true;
      }
    }
    for(int i=0;i<3;i++){
      if(bordState[i]==symbol&&bordState[i+3]==symbol&&bordState[i+6]==symbol){
        return true;
      }
    }
    return false;
  }


}
