import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/bloc/post_bloc/post_bloc.dart';
import 'package:flutter_application_ceiba/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_ceiba/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_application_ceiba/models/user_model.dart';
import 'package:flutter_application_ceiba/widgets/global_widgets/widgets_global.dart';
import 'package:flutter_application_ceiba/widgets/user_widgets/widgets_user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String valorABuscar = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: BlocBuilder<UserBloc,UserState>(
        builder: (context, state) {

          if (state is UserLoadingState) {
            return const ProgressCustom();
          }

          if (state is UserSyncDataState) {
            return const SynchronAnimation();
          }

          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return Body(
              child: Column(
                children: [
                  verticalSeparator(context, 2),

                  FieldCustom(
                    title: 'Buscar usuario',
                    onChanged: (value){
                      valorABuscar= value.toString();
                      setState(() {});
                    }
                  ),

                  verticalSeparator(context, 2),

                  ListView.builder(
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
                        child: CardUserCustom( user : userList[index] ));
                    }
                  )
                ],
              ),
            );
          }

          if (state is UserErrorState) {
            return Center(
              child: TextCustom(text: state.error, align: TextAlign.center,)
            );
          }

          return Container();
        }
      )
    );
  }
}








