import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe_game/resources/socket_client.dart';
import 'package:tic_tac_toe_game/screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom({required String nickname}) {
    if (nickname.isNotEmpty) {
      ///using emit we can send all type of data in the server
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  ///for crate room success listener
  void createRoomSuccessListener({required BuildContext context}) {
    _socketClient.on("createRoomSuccess", (room) {
      print("=== === Room data : $room === ===");
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}
