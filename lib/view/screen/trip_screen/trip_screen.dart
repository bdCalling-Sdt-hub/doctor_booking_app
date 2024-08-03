import 'package:flutter/material.dart';
import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const UserNavBar(currentIndex: 1,),

      appBar: AppBar(title: Text('Trip'),),
    );
  }
}
