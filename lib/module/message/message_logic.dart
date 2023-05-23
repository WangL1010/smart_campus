import 'package:get/get.dart';
import 'package:smart_campus/app/common/dialog/top/top_dialog.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';

import 'message_state.dart';

class MessageLogic extends GetxController {
  final MessageState state = MessageState();
  @override
  void onReady() {
    super.onReady();
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
        // _loadData(index: 1, isLoading: true);
      },
    );
  }
}
