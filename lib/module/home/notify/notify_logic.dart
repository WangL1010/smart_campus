import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/utils/text_utils.dart';
import 'package:smart_campus/data/bean/home/notification_bean.dart';
import 'package:smart_campus/module/home/notify/notify_detail/notify_detail_state.dart';
import 'package:smart_campus/module/home/notify/notify_detail/notify_detail_view.dart';

import '../../../app/common/utils/toast_util.dart';
import 'notify_state.dart';

//
class NotifyLogic extends GetxController {
  final NotifyState state = NotifyState();

  @override
  void onReady() {
    super.onReady();
    state.showNotify =
        notificationBeanFromJson(notificationBeanToJson(notifications));
    update();
  }

  void onSearch() {
    if (StringUtils.isEmpty(state.searchController.text)) {
      ToastUtil.showToast('请输入搜索内容');
      return;
    }
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    state.showNotify.clear();
    for (NotificationBean data in notifications) {
      if (data.title!.contains(state.searchController.text)) {
        state.showNotify.add(data);
      }
    }
    update();
  }

  void toDetail(NotificationBean info) {
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    info.isRead = true;
    Get.to(NotifyDetailPage(), arguments: {
      NotifyDetailState.keyData: info,
    });
  }
}
