import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/env/environment.dart';

import 'separator_widget.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    required this.text,
    this.icon,
    this.size  = 16.0,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
    this.align = TextAlign.justify,
    this.widthBox = 1,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign? align;
  final double?  widthBox;

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.of(context).size;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon==null
        ? const SizedBox()
        : Icon(icon, color: Environment.greenColor),

        horizontalSeparator(context, 1),

        SizedBox(
          width: icon==null
          ?media.width*(0.82*widthBox!)
          :media.width*(0.76*widthBox!),
          child: Text(text,
            textAlign: align,
            style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: weight
            ),
          ),
        ),
      ],
    );
  }
}