import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';
import 'package:smart_campus/app/utils/text_utils.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';

import '../../../../app/common/dialog/full/full_dialog.dart';
import '../../../../data/bean/home/club_activity_bean.dart';
import 'add_activity_state.dart';

class AddActivityLogic extends GetxController {
  final AddActivityState state = AddActivityState();

  void onClub(FilterInfo data) {
    state.curType = data;
    update();
  }

  Future<void> submit() async {
    if (StringUtils.isEmpty(state.activityTimeController.text) ||
        StringUtils.isEmpty(state.placeController
            .text)||StringUtils.isEmpty (state.contentController.text)
    ){
      ToastUtil.showToast('请完善信息');
      return;
    }
    var isSubmit = await FullDialog.showConfirm(
    context: Get.context!,
    title: '提示',
    content: '请确认是否要提交！',
    );
    if (!isSubmit) {
    return;
    }
    DateTime now=DateTime.now();
    ClubActivityBean result=ClubActivityBean(
    isJoin: 2,
    clubName: state.curType?.name??'',
    clubId: int.tryParse(state.curType?.tag??''),
    activityTime: state.activityTimeController.text,
    activityPlace: state.placeController.text,
    activityCapacity: 0,
    activityContent: state.contentController.text,
    publishTime:'${now.year}年${now.month}月${now.day}日'

    );
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 2), () => SmartDialog.dismiss());
    Get.back(result: result);
  }
}
