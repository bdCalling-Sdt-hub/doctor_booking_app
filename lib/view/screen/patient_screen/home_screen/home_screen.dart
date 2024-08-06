import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:doctor_booking/utils/app_const/app_const.dart';
import 'package:doctor_booking/view/widgets/patient_nav_bar/patient_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'inner_widgets/home_appbar.dart';
import 'inner_widgets/side_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.whiteLightActive,

      ///===================================Side Drawer=============================
      drawer: const SideDrawer(),
      bottomNavigationBar: const PatientNavBart(currentIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///====================== Home AppBar and banner =======================
            HomeAppBar(
              scaffoldKey: scaffoldKey,
              image: AppConstants.userNtr,
              name: 'Hi, Robert Smith',
              location: 'California, USA',
            ),
            SizedBox(
              height: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
