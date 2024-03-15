import 'package:flutter/material.dart';

import '../utils/cores_personalizadas.dart';

Widget circleLoadSpinner(context, swidth) {
  return Container(
    width: swidth,
    padding: const EdgeInsets.only(top: 100),
    child: Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          color: CoresPersonalizadas.azulObama,
        ),
      ),
    ),
  );
}
