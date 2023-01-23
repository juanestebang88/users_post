import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/Post/ui/screens/posts_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_ceiba/Post/bloc/post_bloc.dart';
import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/User/bloc/user_bloc.dart';
import 'package:flutter_application_ceiba/User/model/user_model.dart';
import 'package:flutter_application_ceiba/widgets/widgets_global.dart';
import 'package:flutter_application_ceiba/User/ui/widgets/widgets_user.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {

          if (state is UserLoadingState) return const ProgressCustom();
          
          if (state is UserSyncDataState) return const SynchronAnimation();

          if (state is UserErrorState) return TextCustom(text: state.error, align: TextAlign.center,);

          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return Body(
              child: Column(
                children: [
                  verticalSeparator(context, 2),

                  FieldCustom(title: 'Buscar usuario',
                    onChanged: (value) => BlocProvider.of<UserBloc>(context, listen: false).add(SearchUserEvent(value))
                  ),

                  verticalSeparator(context, 2),

                  userList.isEmpty
                  ?TextCustom(text: 'List is empty', size: 20, color: Environment.grayColor, align: TextAlign.center,)
                  :ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final userId = userList[index].id.toString();

                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<PostBloc>(context, listen: false).add(LoadPostEvent(id: userId ));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PostsScreen(user: userList[index])
                            )
                          );
                        },
                        child: CardUserCustom( user : userList[index] )
                      );
                    }
                  )
                ],
              ),
            );
          }

          return Container();
        }
      )
    );
  }
}