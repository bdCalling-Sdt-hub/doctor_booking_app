import 'package:doctor_booking/service/api_url.dart';
import 'package:flutter/foundation.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:socket_io_client/socket_io_client.dart';

///<------------------------- Socket Class ---------------->
class SocketApi {
  // late IO.Socket socket;
  // Factory constructor to return the same static instance every time you create an object.
  factory SocketApi() {
    return _socketApi;
  }

  // An internal private constructor to access it only once for the static instance of the class.
  SocketApi._internal();

  ///<------------------------- Socket Client ---------------->

  static io.Socket socket = io.io(
    ApiUrl.socketUrl,
    io.OptionBuilder().setTransports(['websocket']).build(),
  );

  ///<------------------------- Socket Initialization ---------------->
  static void init() {
    debugPrint(
        '=============> Socket initialization, connected: ${socket.connected}');
    if (!socket.connected) {
      // socket.connect();
      socket.onConnect((_) {
        debugPrint(
            '==============>>>>>>> Socket Connected ${socket.connected}===============<<<<<<<');
      });

      //<----------------------Listen for new message--------------->

      socket.on('unauthorized', (dynamic data) {
        debugPrint('Unauthorized');
      });
      socket.onError((dynamic error) {
        debugPrint('Socket error: $error');
      });
      socket.onDisconnect((dynamic data) {
        debugPrint('Socket instance disconnected');
      });
    } else {
      debugPrint('Socket instance already connected');
    }
  }

  static final SocketApi _socketApi = SocketApi._internal();
}
