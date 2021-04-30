import 'package:flutter/material.dart';
// https://www.jianshu.com/p/74e82fa87174
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page}): super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>page,transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) =>FadeTransition(
    opacity: animation,
    child: child,
  ),
  );
}