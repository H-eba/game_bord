import 'package:flutter/material.dart';
import 'package:game_bord/first_screen.dart';
import 'package:game_bord/game_bord_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: {
     GameBordScreen.routeName:(_)=>GameBordScreen(),
      Screen.routeName:(_)=>Screen(),
    },
    initialRoute:Screen.routeName,
  ));
}
