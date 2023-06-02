import 'package:get/get.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';
import 'package:smart_campus/app/http/dio_request.dart';
import 'package:smart_campus/app/utils/text_utils.dart';
import 'package:smart_campus/data/bean/user/user_bean.dart';
import 'package:smart_campus/data/bean/user/user_info_manager.dart';
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
    if (StringUtils.isEmpty(state.phoneNumController?.text) ||
        StringUtils.isEmpty(state.passwordController?.text)) {
      ToastUtil.showToast('请输入登录信息');
      return;
    }
    UserBean userBean = UserBean(
      userphone: state.phoneNumController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );
    Http.instance?.openLog();
    var result = await Http().request(
      'users/login',
      data: userBean,
      method: DioMethod.post,
      isLoading: true,
    );
    if (result == null) {
      ToastUtil.showToast('登陆失败，账号或密码错误');
      return;
    }
    UserBean data = UserBean.fromJson(result);
    UserInfoManager.instance.updateUserInfo(data);
    ToastUtil.showToast('登陆成功');
    Get.to(MainPage());
  }

  void onSignUp() {
    //跳转到注册页面
    Get.to(RegisterPage());
  }
}
