import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_ceiba/User/repository/post_db_repository.dart';
import 'package:flutter_application_ceiba/User/repository/user_api_repository.dart';
import 'package:flutter_application_ceiba/Post/repository/post_api_repository.dart';

import 'package:flutter_application_ceiba/User/bloc/user_bloc.dart';
import 'package:flutter_application_ceiba/Post/bloc/post_bloc.dart';

import 'package:flutter_application_ceiba/env/environment.dart';
import 'package:flutter_application_ceiba/router/routes.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserAPIRepository()),
        RepositoryProvider(create: (context) => UserDBRepository()),
        RepositoryProvider(create: (context) => PostAPIRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserBloc(
            RepositoryProvider.of<UserDBRepository>(context),
            RepositoryProvider.of<UserAPIRepository>(context)
          )..add(LoadUserEvent())),
          BlocProvider(create: (context) => PostBloc(RepositoryProvider.of<PostAPIRepository>(context))) 
        ], 
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prueba de ingreso',
          initialRoute: 'users',
          routes: getApplicationRoutes(),
          theme: ThemeData(
            scaffoldBackgroundColor: Environment.backgroundColor,
          ),
        )
      )
    );
  }
}
