import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/function/function.dart';

import 'size_animation.dart';

class SearchTopHelper extends StatelessWidget {
  const SearchTopHelper({
    Key? key,
    this.onBarrier,
    this.child,
  }) : super(key: key);

  final ParamVoidCallback? onBarrier;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SizeAnimation(
          bgChild: GestureDetector(
            onTap: () => onBarrier?.call(),
            child: Container(color: Colors.black.withOpacity(0.36)),
          ),
          child: child,
        ),
      ),
    );
  }
}
