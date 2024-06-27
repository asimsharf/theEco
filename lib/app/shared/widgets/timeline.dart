//
//    return theTimeline(
//                 context: context,
//                 index: index,
//                 height: 406.h,
//                 isEn: Get.locale?.languageCode == 'en',
//                 title: DateTime.now().year.toString(),
//                 subtitle: DateTime.now().month.monthName,
//                 child: Container(
//                   width: 322.w,
//                   height: 406.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r),
//                     border: Border.all(
//                       color: const Color(0xFFECEDEE),
//                       width: 2,
//                     ),
//                   ),
//                 ),
//               );
//
// Widget theTimeline({
//   context,
//   required int index,
//   required double height,
//   required bool isEn,
//   required Widget child,
//   required String title,
//   required String subtitle,
// }) =>
//     LayoutBuilder(
//       builder: (context, constraints) {
//         return SizedBox(
//           height: height.h,
//           width: constraints.maxWidth,
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 30.sp,
//                 left: isEn ? 20.sp : null,
//                 right: isEn ? null : 20.sp,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       subtitle,
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: index == 0 ? 44.sp : 0,
//                 left: isEn ? -6.sp : null,
//                 right: isEn ? null : -6.sp,
//                 bottom: -20.sp,
//                 child: SizedBox(
//                   height: double.infinity,
//                   child: VerticalDivider(
//                     color: const Color(0xFF004D41),
//                     thickness: 2,
//                     width: 20.w,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 44.sp,
//                 left: isEn ? 1.sp : null,
//                 right: isEn ? null : 1.sp,
//                 child: Container(
//                   width: 7.w,
//                   height: 7.h,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF004D41),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 100.sp,
//                 left: isEn ? 16.sp : 5.sp,
//                 right: isEn ? 5.sp : 16.sp,
//                 bottom: 0.sp,
//                 child: child,
//               ),
//             ],
//           ),
//         );
//       },
//     );
