import 'package:get/get.dart';

import '../../../../data/bean/home/competition_bean.dart';

class GameDetailState {
  static String keyData = 'keyData';
  late CompetitionBean data;
  GameDetailState() {
    data=CompetitionBean();
  }
  void configData() {
    var arguments = Get.arguments;
    if (arguments == null) {
      return;
    }
    data = arguments[keyData];
  }
}
