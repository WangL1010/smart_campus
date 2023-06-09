import 'package:flutter/material.dart';

import 'easy_popup_child.dart';
import 'easy_popup_route.dart';

class EasyPopup {
  ///使弹窗消失
  static pop(BuildContext context) {
    EasyPopupRoute.pop(context);
  }

  ///展示弹窗
  static show(
    BuildContext context,
    EasyPopupChild child, {
    Offset? offsetLT,
    Offset? offsetRB,
    bool cancelable = true,
    bool darkEnable = true,
    Duration duration = const Duration(milliseconds: 300),
    List<RRect>? highlights,
  }) {
    Navigator.of(context).push(
      EasyPopupRoute(
        child: child,
        offsetLT: offsetLT,
        offsetRB: offsetRB,
        cancelable: cancelable,
        darkEnable: darkEnable,
        duration: duration,
        highlights: highlights,
      ),
    );
  }

  ///设置弹出高亮位置
  static setHighlights(BuildContext context, List<RRect> highlights) {
    EasyPopupRoute.setHighlights(context, highlights);
  }
}
