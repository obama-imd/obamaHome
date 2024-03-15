import 'package:flutter/material.dart';

import '../utils/cores_personalizadas.dart';

Widget circleLoadSpinner(context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 100),
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