import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/widgets/global_widgets/widgets_global.dart';

class FieldCustom extends StatelessWidget {
  const FieldCustom({
    required this.title,
    required this.onChanged,
    Key? key, 
  }) : super(key: key);

  final Function(String) onChanged;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 14),
          alignment: Alignment.centerLeft,
          child: TextCustom(
            text: title,
            color: Environment.greenColor
          )
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.9,
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Environment.greenColor, width: 2)
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Environment.greenColor, width: 1)
              ),
            ),
            cursorColor: Environment.greenColor,
            style: const TextStyle(fontSize: 18.0),
            onChanged: onChanged
          ),
        ),
      ],
    );
  }
}

