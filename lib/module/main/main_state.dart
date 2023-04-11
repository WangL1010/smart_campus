import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/widget/image_overlay.dart';
import 'package:smart_campus/app/common/widget/keep_alive_page.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/module/home/home_view.dart';
import 'package:smart_campus/module/message/message_view.dart';
import 'package:smart_campus/module/mine/mine_view.dart';

class MainState {
  late PageController controller;
  late List<Widget> pages;
  late int currentIndex;
  late List<BottomNavigationBarItem> bottomNavigationBarItems;
  late Color defaultColor;
  late Color activeColor;

  MainState() {
    this
      ..controller = PageController(initialPage: 0)
      ..pages = []
      ..currentIndex = 0
      ..defaultColor = const Color(0xFF999999)
      ..activeColor = const Color(0xFF3F4DAA)
      ..bottomNavigationBarItems = [
        navigatorItem(
          icon: ImageCommon.home,
          activeIcon: ImageCommon.home_active,
          label: '首页',
          width: 30,
          height: 30,
        ),
        navigatorItem(
          icon: ImageCommon.message,
          activeIcon: ImageCommon.message_active,
          label: '消息',
          width: 30,
          height: 30,
        ),
        navigatorItem(
          icon: ImageCommon.mine,
          activeIcon: ImageCommon.mine_active,
          label: '我的',
          width: 30,
          height: 30,
        ),
      ]
      ..pages = [
        KeepAlivePage(child: HomePage()),
        KeepAlivePage(child: MessagePage()),
        KeepAlivePage(child: MinePage()),
      ];
  }
}

BottomNavigationBarItem navigatorItem({
  required String icon,
  required String activeIcon,
  String? label,
  double? width,
  double? height,
}) {
  return BottomNavigationBarItem(
    icon: ImageOverlay(
      width: width,
      height: height,
      image: AssetImage(icon),
    ),
    activeIcon: ImageOverlay(
      width: width,
      height: height,
      image: AssetImage(activeIcon),
    ),
    label: label,
  );
}
