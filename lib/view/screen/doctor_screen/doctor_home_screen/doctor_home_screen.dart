import 'package:doctor_booking/view/widgets/doctor_nav_bar/doctor_nav_bar.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: DoctorNavBar(currentIndex: 0),
    );
  }
}
