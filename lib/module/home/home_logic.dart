import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/http/dio_request.dart';
import 'package:smart_campus/data/bean/home/news_detail_bean.dart';
import 'package:smart_campus/data/bean/user/user_bean.dart';
import 'package:smart_campus/data/bean/user/user_info_manager.dart';
import 'package:smart_campus/module/home/club_activity/club_activity_view.dart';
import 'package:smart_campus/module/home/game_info/game_info_view.dart';
import 'package:smart_campus/module/home/news_detail/news_detail_state.dart';
import 'package:smart_campus/module/home/news_detail/news_detail_view.dart';
import 'package:smart_campus/module/home/notify/notify_view.dart';
import 'package:smart_campus/module/home/schedule/schedule_view.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onReady() {
    super.onReady();
    loadData(isloading: true);
  }

  void loadData({required bool isloading}) async {
    UserBean userBean = UserInfoManager.instance.loginUserBean!;
    var result = await Http().request(
      'users/login',
      data: userBean,
      method: DioMethod.post,
      isLoading: isloading,
    );
    state.showNews = newsList;
    state.refreshController.finishRefresh();
    state.refreshController.finishLoad(noMore: false);
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

  void onLoad() {
    for (var element in newsList) {
      state.showNews.add(element);
    }
    state.refreshController.finishRefresh();
    state.refreshController.finishLoad(noMore: false);
    update();
  }

  void toDetail(NewsDetailBean data) {
    Get.to(NewsDetailPage(), arguments: {
      NewsDetailState.keyData: data,
    });
  }
}
