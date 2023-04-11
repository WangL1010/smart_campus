import 'package:flutter/material.dart';

class EasyPopupRoute extends PopupRoute {
  final Widget child;
  final Duration duration;

  EasyPopupRoute({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => duration;
}
