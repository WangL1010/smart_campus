import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/data/bean/home/club_activity_bean.dart';
import 'package:smart_campus/module/home/club_activity/activity_detail/activity_detail_view.dart';

import '../../../app/common/dialog/top/top_dialog.dart';
import '../../../app/common/utils/toast_util.dart';
import '../../../app/utils/text_utils.dart';
import '../../../data/bean/common/filter_info.dart';
import 'activity_detail/activity_detail_state.dart';
import 'club_activity_state.dart';

class ClubActivityLogic extends GetxController {
  final ClubActivityState state = ClubActivityState();
  @override
  void onReady() {
    super.onReady();
    state.shows=clubActivityBeanFromJson(clubActivityBeanToJson(testCases));
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
        _loadData(
          index: int.parse(state.curType?.tag ?? ''),
        );
      },
    );
  }

  void _loadData({required int index}) {
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    state.shows.clear();
    for (ClubActivityBean data in testCases) {
      if (data.clubId == index || index == 0) {
        state.shows.add(data);
      }
    }
    update();
  }

 void  onSeach() {
   if (StringUtils.isEmpty(state.searchController.text )) {
     ToastUtil.showToast('请输入搜索内容');
     return;
   }
   SmartDialog.showLoading();
   Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
   state.shows.clear();
   for (ClubActivityBean data in testCases) {
     if (data.activityContent!.contains(state.searchController.text )) {
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
    for (ClubActivityBean data in testCases) {
      if (data.isJoin == index ||index == 0) {
        state.shows.add(data);
      }
    }
    update();
  }

  void toDetail(ClubActivityBean info) {
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    Get.to(ActivityDetailPage(),arguments: {
      ActivityDetailState.keyData:info,
    });
  }

}
