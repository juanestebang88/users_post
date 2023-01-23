import 'package:flutter/material.dart';

import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/widgets/widgets_global.dart';

class SynchronAnimation extends StatelessWidget {
  const SynchronAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80,
        child: Column(
          children: [
            Bounce(
              infinite:true,
              child: Icon(Icons.arrow_circle_down_rounded, color: Environment.greenColor, size: 50,)
            ),
            TextCustom(text: 'Download data', color: Environment.greenColor, align: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
