import 'package:get/get.dart';
import 'package:smart_campus/module/home/schedule/schedule_view.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onReady() {
    super.onReady();
    update();
  }

  //跳转到课程表
  void onSchedule() {
    Get.to(
      SchedulePage(),
    );
  }
}
