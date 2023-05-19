import 'package:get/get.dart';
import 'package:smart_campus/module/home/club_activity/club_activity_view.dart';
import 'package:smart_campus/module/home/game_info/game_info_view.dart';
import 'package:smart_campus/module/home/notify/notify_view.dart';
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

  void onNotify() {
    Get.to(NotifyPage());
  }

  void onClubActivity() {
    Get.to(ClubActivityPage());
  }

  void onGameInfo() {
    Get.to(GameInfoPage());
  }
}
