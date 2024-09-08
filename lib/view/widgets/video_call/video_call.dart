import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioVideoCall extends StatelessWidget {
  AudioVideoCall({super.key, required this.callID});

  final String callID;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 676521339,
        appSign:
            "336c55d66acd9148e6569643d7d4bb39ab1da80e5c282412aaa3aa578f35f118",
        callID: callID,
        userID: "user_",
        userName: "user_",
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
