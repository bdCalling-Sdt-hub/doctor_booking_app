import 'package:doctor_booking/controller/general_controller/general_controller.dart';
import 'package:doctor_booking/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioVideoCall extends StatelessWidget {
  AudioVideoCall({
    super.key,
    required this.callID,
    required this.userName,
    required this.doctorId,
    required this.receiverId,
  });

  final String callID;
  final String userName;
  final String doctorId;
  final String receiverId;

  //final String userID = Random().nextInt(1000000).toString();
  final GeneralController controller = Get.find<GeneralController>();
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        events: ZegoUIKitPrebuiltCallEvents(),
        onDispose: () {
          //TODO Have to FIX it
          controller.createCallHistory(
              senderId: doctorId, receiverId: receiverId, userName: userName);
        },
        appID: ZEGOCLOUD_APP_ID,
        appSign: ZEGOCLOUD_APP_SIGN,
        callID: callID,
        userID: doctorId,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
