import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/env/environment.dart';

class ProgressCustom extends StatelessWidget {
  const ProgressCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Environment.greenColor,
        backgroundColor: Environment.grayColor,
        strokeWidth: 5,
      ),
    );
  }
}