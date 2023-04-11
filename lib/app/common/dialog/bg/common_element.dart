import 'package:flutter/material.dart';

import 'dialog_bg_widget.dart';

///AppBar高亮
typedef DialogParamVoidCallback = dynamic Function();

class AppBarLight extends StatelessWidget {
  AppBarLight({
    required this.onDismiss,
    required this.child,
    this.offsetLT,
    this.offsetRB,
    this.duration = const Duration(milliseconds: 300),
    this.cancelable = true,
    this.darkEnable = true,
    this.highlights,
  });

  ///子控件
  final Widget child;

  ///高亮背景偏移量
  final Offset? offsetLT, offsetRB;

  ///背景渐入渐出事件
  final Duration duration;

  ///能否被取消
  final bool cancelable;

  ///是否显示黑色
  final bool darkEnable;

  ///高亮多个区域
  final List<RRect>? highlights;

  ///结局自定义布局动画的地方必须加在该回调内
  ///点击非自定义控件区域和返回区域都会回调该处, 说明需要弹窗该弹窗栈
  final DialogParamVoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return DialogBgWidget(
      onDismiss: onDismiss,
      offsetLT: Offset(
        0,
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height,
      ),
      offsetRB: offsetRB,
      duration: duration,
      cancelable: cancelable,
      darkEnable: darkEnable,
      highlights: highlights,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height,
          ),
          child: child,
        ),
      ),
    );
  }
}
