import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/bean/home/notification_bean.dart';

class NotifyDetailState {
  static String keyData = 'keyData';
  late NotificationBean data;

  NotifyDetailState() {
  data=NotificationBean();

  }
  void configData() {
    var arguments = Get.arguments;
    if (arguments == null) {
      return;
    }
    data = arguments[keyData];
  }
}
