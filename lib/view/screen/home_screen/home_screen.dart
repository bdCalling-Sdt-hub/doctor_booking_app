import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';

import 'inner_widgets/home_appbar.dart';
import 'inner_widgets/side_drawer.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      ///===================================Side Drawer=============================
      drawer: SideDrawer(),
      bottomNavigationBar: const UserNavBar(currentIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///====================== Home AppBar and banner =======================
            HomeAppBar(scaffoldKey: scaffoldKey),
            SizedBox(
              height: 10.w,
            ),

          ],
        ),
      ),
    );
  }
}