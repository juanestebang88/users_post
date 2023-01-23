import 'package:flutter/material.dart';

import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/models/user_model.dart';
import 'package:flutter_application_ceiba/widgets/global_widgets/widgets_global.dart';

class CardUserCustom extends StatelessWidget {
  const CardUserCustom({
    required this.user,
    Key? key, 
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final name = user.name;
    final phone= user.phone;
    final email= user.email;

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
            TextCustom(text: name, color: Environment.greenColor, size: 18, weight: FontWeight.bold),
    
            verticalSeparator(context, 1),
    
            TextCustom(text: phone, size: 15, icon: Icons.phone,),
    
            TextCustom(text: email, size: 15, icon: Icons.mail,),
    
            verticalSeparator(context, 1),
    
            TextCustom(
              text: 'VER PUBLICACIONES',
              size: 14,
              color : Environment.greenColor,
              weight: FontWeight.w900,
              align : TextAlign.end
            ),
    
            verticalSeparator(context, 1),
    
          ],
        ),
      ),
    );
  }
}

