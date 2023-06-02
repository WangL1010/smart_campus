import 'package:get/get.dart';
import 'package:smart_campus/app/common/dialog/full/full_dialog.dart';
import 'package:smart_campus/module/login/login_view.dart';
import 'package:smart_campus/module/mine/mine_topic/mine_topic_view.dart';
import 'package:smart_campus/module/mine/user_info/user_info_view.dart';

import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();

  void onLogOut() async {
    var isSubmit = await FullDialog.showConfirm(
      context: Get.context!,
      title: '提示',
      content: '请确认是否要退出登录！',
    );
    if (!isSubmit) {
      return;
    }
    Get.offAll(LoginPage());
  }

  Future<void> toUserInfo() async {
    var result = await Get.to(UserInfoPage());
    state.user = result;
  }

  void toPublishTopic() {
    Get.to(MineTopicPage());
  }
}
