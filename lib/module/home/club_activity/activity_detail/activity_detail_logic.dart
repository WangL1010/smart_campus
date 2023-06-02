import 'package:get/get.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';
import 'package:smart_campus/module/home/club_activity/join_activity/join_activity_state.dart';
import 'package:smart_campus/module/home/club_activity/join_activity/join_activity_view.dart';

import 'activity_detail_state.dart';

class ActivityDetailLogic extends GetxController {
  final ActivityDetailState state = ActivityDetailState();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    state.configData();
    update();
  }

 Future<void>  join() async {
    if(state.data.isJoin==1){
      ToastUtil.showToast('您已报名该活动');
      return;
    }
   var result=await Get.to(JoinActivityPage(),arguments: {
      JoinActivityState.keyData,state.data,
    });
    state.data.isJoin=result;
    state.data.activityCapacity=state.data.activityCapacity!+1;
    update();
 }
}
