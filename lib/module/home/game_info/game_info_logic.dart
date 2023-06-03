import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/module/home/game_info/game_detail/game_detail_view.dart';

import '../../../app/common/dialog/top/top_dialog.dart';
import '../../../data/bean/common/filter_info.dart';
import '../../../data/bean/home/competition_bean.dart';
import '../club_activity/activity_detail/activity_detail_state.dart';
import 'game_info_state.dart';

class GameInfoLogic extends GetxController {
  final GameInfoState state = GameInfoState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    state.shows=competitionBeanFromJson(competitionBeanToJson(competitionList));
    update();
  }

  void onSelectType() {
    TopDialog.showList<FilterInfo>(
      Get.context!,
      list: state.filterType,
      selected: state.curType,
      showKey: 'name',
      callback: (item) {
        //更新时间
        state.curType = item;
        update();
        //刷新列表
        _loadCollege(
          index: int.parse(state.curType?.tag ?? ''),
        );
      },
    );
  }

  void _loadCollege({required int index}) {
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    state.shows.clear();
    for (CompetitionBean data in competitionList) {
      if (data.collegeType == index || index == 0) {
        state.shows.add(data);
      }
    }
    update();
  }
  void onSelectJoin() {
    TopDialog.showList<FilterInfo>(
      Get.context!,
      list: state.filterJoin,
      selected: state.curJoin,
      showKey: 'name',
      callback: (item) {
        //更新时间
        state.curJoin = item;
        update();
        //刷新列表
        loadJoin(int.parse(item.tag));
      },
    );
  }

  void loadJoin(int index){
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    state.shows.clear();
    for (CompetitionBean data in competitionList) {
      if (data.eventLevelType == index ||index == 0) {
        state.shows.add(data);
      }
    }
    update();
  }

  void toDetail(CompetitionBean info) {
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    Get.to(GameDetailPage(),arguments: {
      ActivityDetailState.keyData:info,
    });
  }


}
