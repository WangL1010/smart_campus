import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../app/common/dialog/full/full_dialog.dart';
import 'user_info_state.dart';

class UserInfoLogic extends GetxController {
  final UserInfoState state = UserInfoState();

  Future<void> submit() async {
    var isSubmit = await FullDialog.showConfirm(
      context: Get.context!,
      title: '提示',
      content: '请确认是否要提交！',
    );
    if (!isSubmit) {
      return;
    }
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 2), () => SmartDialog.dismiss());
    state.user.name=state.nameController.text;
    state.user.userphone=state.phoneController.text;
    state.user.studentId=state.studentIdController.text;
    Get.back(result: state.user);
  }
}
