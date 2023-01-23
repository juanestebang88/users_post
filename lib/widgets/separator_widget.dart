import 'package:flutter/material.dart';

Widget verticalSeparator(BuildContext context, double height) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * height / 100,
  );
}

Widget horizontalSeparator(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width / 100,
  );
}