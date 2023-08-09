import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/provider/room_data_provider.dart';
import 'package:tic_tac_toe_game/resources/socket_client.dart';
import 'package:tic_tac_toe_game/screens/game_screen.dart';
import 'package:tic_tac_toe_game/utils/utils.dart';

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

  ///join room
  void joinRoom({required String nickname, required String roomId}) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      ///using emit we can send all type of data in the server
      _socketClient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  ///for create room success listener
  void createRoomSuccessListener({required BuildContext context}) {
    _socketClient.on("createRoomSuccess", (room) {
      print("=== === Room data : $room === ===");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(roomData: room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  ///for join room success listener
  void joinRoomSuccessListener({required BuildContext context}) {
    _socketClient.on("joinRoomSuccess", (room) {
      print("=== === Room data : $room === ===");
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(roomData: room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  ///for join room success listener
  void errorOccurredListener({required BuildContext context}) {
    _socketClient.on("errorOccurred", (errorMessage) {
      showSnackBar(context: context, message: errorMessage);
    });
  }

  ///for update player data
  void updatePlayersStateListener({required BuildContext context}) {
    _socketClient.on('updatePlayers', (playerData) {
      ///for update first player
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(player1Data: playerData[0]);

      /// for update second player
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(player2Data: playerData[1]);
    });
  }
}
