import 'package:flutter/material.dart';
import 'package:obamahome/utils/app_theme.dart';

// Future<void> circleLoadSpinner(BuildContext context) async {
//   return showDialog<void>(
//     context: context,
//     barrierColor: modalBackground,
//     barrierDismissible: true,
//     builder: (context) {
//       return Dialog.fullscreen(
//         child: Center(
//           child: SizedBox(
//             width: 50,
//             height: 50,
//             child: CircularProgressIndicator(
//               color: background,
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

Widget circleLoadSpinner(context) {
  double sheight = MediaQuery.of(context).size.height;
  double swidth = MediaQuery.of(context).size.width;
  return Container(
    width: swidth,
    height: sheight,
    color: modalBackground,
    child: Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          color: background,
        ),
      ),
    ),
  );
}
