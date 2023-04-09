import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {
  final logic = Get.put(MainLogic());
  final state = Get.find<MainLogic>().state;

  MainPage({Key? key}) : super(key: key);

  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          //弹窗提示
          ToastUtil.showToast('双击返回按钮退出应用');
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: state.controller,
          children: state.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: state.bottomNavigationBarItems,
          currentIndex: state.currentIndex,
          selectedItemColor: state.activeColor,
          unselectedItemColor: state.defaultColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => logic.onJumpPage(index),
        ),
      ),
    );
  }
}
