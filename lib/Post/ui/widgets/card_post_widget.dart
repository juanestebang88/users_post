import 'package:flutter/material.dart';

import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/Post/model/post_model.dart';
import 'package:flutter_application_ceiba/widgets/widgets_global.dart';

class CardPostCustom extends StatelessWidget {
  const CardPostCustom({
    required this.post,
    Key? key, 
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final title = post.title.toUpperCase();
    final body= post.body;

    return FadeInUp(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Environment.whiteColor,
          border: Border.all(color:const Color.fromRGBO(196, 196, 196, 0.2)),
          boxShadow: [
            BoxShadow(
              color: Environment.grayColor,
              spreadRadius: -1,
              blurRadius: 0.8,
              offset: const Offset(0, 3)
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(text: title, color: Environment.greenColor, size: 18, weight: FontWeight.bold, align: TextAlign.center),
    
            verticalSeparator(context, 1),
    
            TextCustom(text: body, size: 15, align: TextAlign.justify),
    
            verticalSeparator(context, 1),
    
          ],
        ),
      ),
    );
  }
}

