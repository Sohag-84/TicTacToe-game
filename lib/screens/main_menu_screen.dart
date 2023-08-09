// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/responsive/responsive.dart';
import 'package:tic_tac_toe_game/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = "/main-menu";
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(onTap: () {}, text: "Create Room"),
            SizedBox(height: 20),
            CustomButton(onTap: () {}, text: "Join Room"),
          ],
        ),
      ),
    );
  }
}
