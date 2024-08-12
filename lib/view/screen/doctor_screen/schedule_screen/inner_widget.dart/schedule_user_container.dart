import 'package:doctor_booking/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ScheduleUserContainer extends StatelessWidget {
//   const ScheduleUserContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           alignment: Alignment.center,
//           width: MediaQuery.sizeOf(context).width,
//           height: 70.h,
//           decoration: BoxDecoration(
//             color: AppColors.whiteNormal,
//             borderRadius: BorderRadius.circular(100),
//           ),
//         ),
//         Row(
//           children: List.generate(
//               5,
//               (index) => CustomNetworkImage(
//                     imageUrl: AppConstants.userNtr,
//                     height: 70,
//                     width: 70,
//                     boxShape: BoxShape.circle,
//                   ),),
//         )
//       ],
//     );
//   }
// }

// class ScheduleUserContainer extends StatelessWidget {
//   const ScheduleUserContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           alignment: Alignment.center,
//           width: MediaQuery.sizeOf(context).width,
//           height: 70.h,
//           decoration: BoxDecoration(
//             color: AppColors.whiteNormal,
//             borderRadius: BorderRadius.circular(100),
//           ),
//         ),

//       ],
//     );
//   }
// }

class AvatarRow extends StatelessWidget {
  final List<String> avatars;
  final int extraCount;

  const AvatarRow({super.key, required this.avatars, required this.extraCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Loop through the avatars and create a CircleAvatar for each
          for (var avatar in avatars) ...[
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 30,
            ),
            SizedBox(width: 10.h),
          ],
          // Add the "extra" CircleAvatar for remaining avatars
          if (extraCount > 0)
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 30,
                ),
                Text(
                  "$extraCount+",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackNormal,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}




























// import 'package:flutter/material.dart';

// class CardExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Circular Avatars with Badge'),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     height: 60, // Set the height to adjust avatar size
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: <Widget>[
//                         _buildAvatar(
//                             'https://via.placeholder.com/150'), // Example avatar URL
//                         _buildAvatar('https://via.placeholder.com/150'),
//                         _buildAvatar('https://via.placeholder.com/150'),
//                         _buildAvatar('https://via.placeholder.com/150'),
//                         _buildAvatar('https://via.placeholder.com/150'),
//                         _buildAvatar('https://via.placeholder.com/150'),
//                         _buildAvatar('https://via.placeholder.com/150'),
//                         _buildMoreBadge(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAvatar(String imageUrl) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//       child: CircleAvatar(
//         radius: 25, // Adjust the radius for the desired size
//         backgroundImage: NetworkImage(imageUrl),
//       ),
//     );
//   }

//   Widget _buildMoreBadge() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//       child: CircleAvatar(
//         radius: 25,
//         backgroundColor: Colors.grey.shade300,
//         child: Text(
//           '35+',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
