import 'package:doctor_booking/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioVideoCall extends StatelessWidget {
  const AudioVideoCall({
    super.key,
    required this.callID,
    required this.userName,
    required this.userID,
  });

  final String callID;
  final String userName;
  final String userID;

  //final String userID = Random().nextInt(1000000).toString();

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        events: ZegoUIKitPrebuiltCallEvents(),
        onDispose: () {
          print("---------- Dispose");
        },
        appID: ZEGOCLOUD_APP_ID,
        appSign: ZEGOCLOUD_APP_SIGN,
        callID: callID,
        userID: userID,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
