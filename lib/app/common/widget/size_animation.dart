import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  const SizeAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    this.child,
    this.bgChild,
  }) : super(key: key);

  final Duration duration;

  final Widget? child;

  final Widget? bgChild;

  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctr;

  @override
  void initState() {
    _ctr = AnimationController(vsync: this, duration: widget.duration);
    _ctr.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //背景
      widget.bgChild ?? Container(),

      //主体
      SizeTransition(
        axis: Axis.vertical,
        sizeFactor: CurvedAnimation(parent: _ctr, curve: Curves.linear),
        child: widget.child,
      )
    ]);
  }

  @override
  void dispose() {
    _ctr.dispose();

    super.dispose();
  }
}
