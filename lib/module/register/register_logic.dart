import 'package:get/get.dart';
import 'package:smart_campus/app/common/dialog/top/top_dialog.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';
import 'package:smart_campus/app/http/dio_request.dart';
import 'package:smart_campus/app/utils/text_utils.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';
import 'package:smart_campus/data/bean/user/user_bean.dart';
import 'package:smart_campus/module/login/login_view.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  Future<void> onRegister() async {
    if (StringUtils.isEmpty(state.phoneNumController?.text)) {
      ToastUtil.showToast('请输入电话号码');
      return;
    }
    if (StringUtils.isEmpty(state.passwordController?.text)) {
      ToastUtil.showToast('请输入密码');
      return;
    }
    if (StringUtils.isEmpty(state.studentNumController?.text)) {
      ToastUtil.showToast('请输入学号');
      return;
    }
    if (StringUtils.isEmpty(state.rePasswordController?.text)) {
      ToastUtil.showToast('请输入重复密码');
      return;
    }
    if (!StringUtils.isPhone(state.phoneNumController?.text ?? '')) {
      ToastUtil.showToast('电话号码格式不正确');
      return;
    }
    if (!(state.passwordController?.text == state.rePasswordController?.text)) {
      ToastUtil.showToast('密码不相同');
      return;
    }
    UserBean userBean = UserBean(
      name: '游客',
      userphone: state.passwordController?.text,
      password: state.passwordController?.text,
      schoolId: int.tryParse(state.curSchool?.tag ?? ''),
      schoolName: state.curSchool?.name,
      studentId: state.studentNumController?.text,
    );
    var response = await Http.instance?.request(
      '',
      data: userBean,
      method: DioMethod.post,
      isLoading: true,
    );
    if (response == null) {
      return;
    }
    ToastUtil.showToast('注册成功,请输入账号密码登录');
    Get.to(LoginPage());
  }

  void selectSchool() {
    TopDialog.showList<FilterInfo>(
      Get.context!,
      list: state.filterSchool,
      selected: state.curSchool,
      showKey: 'name',
      callback: (item) {
        //更新时间
        state.curSchool = item;
        update();
        //刷新列表
      },
    );
  }
}
