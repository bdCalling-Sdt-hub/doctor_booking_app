import 'package:doctor_booking/utils/api_keys.dart';
import 'package:doctor_booking/view/screen/doctor_screen/doctor_home_screen/doctor_home_controller/doctor_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioVideoCall extends StatelessWidget {
  AudioVideoCall({
    super.key,
    required this.callID,
    required this.userName,
    required this.senderID,
    required this.receiverId,
  });

  final String callID;
  final String userName;
  final String senderID;
  final String receiverId;

  //final String userID = Random().nextInt(1000000).toString();
  final DoctorHomeController controller = Get.find<DoctorHomeController>();
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        events: ZegoUIKitPrebuiltCallEvents(),
        onDispose: () {
          print("---------- Dispose");
          controller.createCallHistory(
              senderId: senderID, receiverId: receiverId);
        },
        appID: ZEGOCLOUD_APP_ID,
        appSign: ZEGOCLOUD_APP_SIGN,
        callID: callID,
        userID: senderID,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
