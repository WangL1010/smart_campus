import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';
import 'package:smart_campus/app/utils/text_utils.dart';

import 'join_activity_state.dart';

class JoinActivityLogic extends GetxController {
  final JoinActivityState state = JoinActivityState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    state.configData();
    update();
  }

 void submit() {
    if(StringUtils.isEmpty(state.nameController.text)){
      ToastUtil.showToast('请输入姓名');
      return;
    }
    if(StringUtils.isEmpty(state.IdController.text)){
      ToastUtil.showToast('请输入学号');
      return;
    }
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    Get.back(result: 1);
 }
}
