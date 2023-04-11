import 'dart:async';

import 'package:get/get.dart';
import 'package:smart_campus/module/login/login_view.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _startTime();
  }

  void _startTime() {
    // 延迟跳转
    Timer(const Duration(seconds: 2), () => Get.to(LoginPage()));
  }
}
