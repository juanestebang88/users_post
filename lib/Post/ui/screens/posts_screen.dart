import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/Post/model/post_model.dart';
import 'package:flutter_application_ceiba/Post/ui/widgets/card_post_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_ceiba/Post/bloc/post_bloc.dart';
import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/User/model/user_model.dart';
import 'package:flutter_application_ceiba/widgets/widgets_global.dart';

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
          if (state is PostLoadingState) return const ProgressCustom();
          
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

                  postList.isEmpty
                  ? const Center(child:  TextCustom(text: 'List post is empty', align: TextAlign.center))
                  : ListView.builder(
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

          if (state is PostErrorState) return TextCustom(text: state.error, align: TextAlign.center);

          return Container();
        }
      )
    );
  }
}