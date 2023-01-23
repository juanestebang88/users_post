
import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/Post/ui/screens/posts_screen.dart';
import 'package:flutter_application_ceiba/User/ui/screens/user_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    'users': (_) => const UserScreen(),
    'posts': (_) => const PostsScreen(),
  };
}
