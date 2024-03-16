import 'package:flutter/material.dart';
import 'package:obamahome/utils/app_theme.dart';

import '../utils/cores_personalizadas.dart';


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

Widget circleLoadSpinner(context, swidth) {
  double sheight = MediaQuery.of(context).size.height;
  return IndexedStack(
    children: [
      Container(
        width: swidth,
        height: sheight,
        color: modalBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: CoresPersonalizadas.azulObama,
            ),
          ),
        ),
      )
    ],
  );
}
