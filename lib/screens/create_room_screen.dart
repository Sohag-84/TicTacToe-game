// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/resources/socket_methods.dart';
import 'package:tic_tac_toe_game/responsive/responsive.dart';
import 'package:tic_tac_toe_game/widgets/custom_button.dart';
import 'package:tic_tac_toe_game/widgets/custom_text.dart';
import 'package:tic_tac_toe_game/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = "/create-room";
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();

  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
                text: "Create Room",
                fontSize: 17,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: "Enter your nickname",
              ),
              SizedBox(height: size.height * 0.04),
              CustomButton(
                onTap: () =>
                    _socketMethods.createRoom(nickname: _nameController.text),
                text: "Create",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
