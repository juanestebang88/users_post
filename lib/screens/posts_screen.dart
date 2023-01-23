import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/models/post_model.dart';
import 'package:flutter_application_ceiba/widgets/post_widgets/card_post_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_ceiba/bloc/post_bloc/post_bloc.dart';
import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/models/user_model.dart';
import 'package:flutter_application_ceiba/widgets/global_widgets/widgets_global.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({
    this.user,
    Key? key
  }) :super(key: key);

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: const AppBarCustom(),
      body:  BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: Environment.greenColor,),
            );
          }
          
          if (state is PostLoadedState) {
            List<PostModel> postList = state.posts;
            return Body(
              child: Column(
                children: [

                  verticalSeparator(context, 2),
                  TextCustom(text: user!.name, color: Environment.greenColor, size:30, weight: FontWeight.bold, align: TextAlign.center,),
          
                  verticalSeparator(context, 1),
          
                  TextCustom(text: user!.phone, size: 15, icon: Icons.phone, widthBox: 0.7, align: TextAlign.center,),
                  TextCustom(text: user!.email, size: 15, icon: Icons.mail, widthBox: 0.7, align: TextAlign.center,),
                  
                  verticalSeparator(context, 4),

                  TextCustom(text: 'Publicaciones', color: Environment.greenColor, size:25, weight: FontWeight.bold, align: TextAlign.center,),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardPostCustom(post: postList[index]);
                    }
                  )
                ],
              ),
            );
          }

          if (state is PostErrorState) {
            return Center(
              child: TextCustom(text: state.error, align: TextAlign.center,)
            );
          } 
          return const Center(
            child:  TextCustom(text: 'List post is empty', align: TextAlign.center)
          );
        }
      )
    );
  }
}

 /*      Body(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            verticalSeparator(context, 2),
            TextCustom(text: user!.name, color: Environment.greenColor, size:45, weight: FontWeight.bold, align: TextAlign.center,),
    
            verticalSeparator(context, 1),
    
            TextCustom(text: user!.phone, size: 25, icon: Icons.phone, align: TextAlign.center,),
    
            TextCustom(text: user!.email, size: 25, icon: Icons.mail, align: TextAlign.center,),

            verticalSeparator(context, 4),

            TextCustom(text: 'POST', color: Environment.greenColor, size:35, weight: FontWeight.bold, align: TextAlign.center,),
            
          ],
        ),
      ), */




