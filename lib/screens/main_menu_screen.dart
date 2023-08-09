// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/responsive/responsive.dart';
import 'package:tic_tac_toe_game/screens/create_room_screen.dart';
import 'package:tic_tac_toe_game/screens/join_room_screen.dart';
import 'package:tic_tac_toe_game/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = "/main-menu";
  const MainMenuScreen({super.key});

  void createRoom({required BuildContext context}) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom({required BuildContext context}) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () => createRoom(context: context),
              text: "Create Room",
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: () => joinRoom(context: context),
              text: "Join Room",
            ),
          ],
        ),
      ),
    );
  }
}
