// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/screens/create_room_screen.dart';
import 'package:tic_tac_toe_game/screens/join_room_screen.dart';
import 'package:tic_tac_toe_game/screens/main_menu_screen.dart';
import 'package:tic_tac_toe_game/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => MainMenuScreen(),
        CreateRoomScreen.routeName: (context) => CreateRoomScreen(),
        JoinRoomScreen.routeName: (context) => JoinRoomScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
