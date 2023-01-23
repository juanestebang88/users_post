import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Center(
          child: child
        )
      )
    );
  }
}