import 'package:tic_tac_toe_game/resources/socket_client.dart';

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
}
