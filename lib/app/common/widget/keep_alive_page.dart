import 'package:flutter/material.dart';

///页面保活,使用 keepAlivePage 包裹你的页面确保在类似 PageView这类的组件中不会被重新构建
Widget keepAlivePage(Widget? child) => KeepAlivePage(child: child);

class KeepAlivePage extends StatefulWidget {
  final Widget? child;

  KeepAlivePage({this.child});

  @override
  State<StatefulWidget> createState() {
    return _KeepAlivePageState();
  }
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }
}
