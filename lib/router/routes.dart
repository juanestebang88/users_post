
import 'package:flutter/material.dart';
import 'package:flutter_application_ceiba/screens/screens.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    'users': (_) => const UserScreen(),
    'posts': (_) => const PostsScreen(),
  };
}
