import 'package:flutter/material.dart';

import '../utils/cores_personalizadas.dart';

Widget circleLoadSpinner(context) {
  return Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: CoresPersonalizadas.azulObama,
            ),
          ),
        );
}