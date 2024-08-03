import 'package:flutter/material.dart';
import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const UserNavBar(currentIndex: 2,),

      appBar: AppBar(title: Text('message'),),
    );
  }
}
