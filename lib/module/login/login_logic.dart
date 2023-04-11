import 'package:get/get.dart';
import 'package:smart_campus/module/main/main_view.dart';
import 'package:smart_campus/module/register/register_view.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  void onLogin() {
    //todo 密码账号校验
    Get.to(MainPage());
  }

  void onSignUp() {
    //跳转到注册页面
    Get.to(RegisterPage());
  }
}
