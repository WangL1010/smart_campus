import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/bean/home/club_activity_bean.dart';

class JoinActivityState {
  static String keyData = 'keyData';
  late ClubActivityBean data;
  late TextEditingController nameController;
  late TextEditingController IdController;
  JoinActivityState() {
    data=ClubActivityBean();
    nameController=TextEditingController();
    IdController=TextEditingController();
  }
  void configData() {
    var arguments = Get.arguments;
    if (arguments == null) {
      return;
    }
    data = arguments[keyData];
  }
}
