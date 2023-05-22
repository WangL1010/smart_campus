import 'package:get/get.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';
import 'package:smart_campus/app/http/dio_request.dart';
import 'package:smart_campus/data/bean/user/user_bean.dart';
import 'package:smart_campus/module/main/main_view.dart';
import 'package:smart_campus/module/register/register_view.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> onLogin() async {
    UserBean userBean = UserBean(
      userphone: '16680804030',
      password: '201908010433',
    );
    DioUtil.instance?.openLog();
    var result = await DioUtil().request(
      'users/login',
      data: userBean,
      method: DioMethod.post,
      isLoading: true,
    );
    if (result == null) {
      return;
    }
    ToastUtil.showToast('登陆成功');
    Get.to(MainPage());
  }

  void onSignUp() {
    ToastUtil.showToast('请输入密码');
    //跳转到注册页面
    Get.to(RegisterPage());
  }
}
