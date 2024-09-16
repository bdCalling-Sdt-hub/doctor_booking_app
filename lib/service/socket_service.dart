import 'package:doctor_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketApi {
  // Singleton instance of the class
  factory SocketApi() {
    return _socketApi;
  }

  // Private constructor for singleton
  SocketApi._internal();

  static late io.Socket socket;

  ///<------------------------- Socket Initialization with dynamic User ID ---------------->

  static void init() async {
    String userId = await SharePrefsHelper.getString(AppConstants.id);
    if (userId.isEmpty || userId == "null") {
      return;
    }
    socket = io.io(
      "http://103.161.9.133:5000?userId=$userId",
      io.OptionBuilder().setTransports(['websocket']).build(),
    );

    debugPrint(
        '$userId=============> Socket initialization, connected: ${socket.connected}');

    // Listen for socket connection
    socket.onConnect((_) {
      debugPrint(
          '==============>>>>>>> Socket Connected ${socket.connected} ===============<<<<<<<');
    });

    // Listen for unauthorized events
    socket.on('unauthorized', (dynamic data) {
      debugPrint('Unauthorized');
    });

    // Listen for errors
    socket.onError((dynamic error) {
      debugPrint('Socket error: $error');
    });

    // Listen for disconnection
    socket.onDisconnect((dynamic data) {
      debugPrint('>>>>>>>>>> Socket instance disconnected <<<<<<<<<<<<$data');
    });
  }

  // Static instance of the class
  static final SocketApi _socketApi = SocketApi._internal();
}
