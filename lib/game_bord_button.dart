import 'package:flutter/material.dart';
class GameBordButton extends StatelessWidget {
  String symbol;
  Function onClik;
  int index;
  GameBordButton({ required this.symbol,required this.onClik,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(2),
            child:
                ElevatedButton (style: ButtonStyle(backgroundColor:
                MaterialStateProperty.all(Colors. deepPurple)),
                  onPressed: (){
                  onClik(index);
                  },child: Text('$symbol',style: TextStyle(

                    fontSize: 25,fontWeight: FontWeight.bold
                ),),)

            ),)
    ;
  }
}
