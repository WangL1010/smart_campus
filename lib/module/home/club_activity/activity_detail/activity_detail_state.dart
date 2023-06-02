import 'package:get/get.dart';

import '../../../../data/bean/home/club_activity_bean.dart';

class ActivityDetailState {
  static String keyData = 'keyData';
  late ClubActivityBean data;
  ActivityDetailState() {
    data=ClubActivityBean();
  }
  void configData() {
    var arguments = Get.arguments;
    if (arguments == null) {
      return;
    }
    data = arguments[keyData];
  }
}
