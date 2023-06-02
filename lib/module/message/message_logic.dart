import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/dialog/top/top_dialog.dart';
import 'package:smart_campus/app/common/utils/toast_util.dart';
import 'package:smart_campus/app/utils/text_utils.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';
import 'package:smart_campus/data/bean/message/topic_card_bean.dart';
import 'package:smart_campus/module/message/add_message/add_message_view.dart';
import 'package:smart_campus/module/message/message_detail/message_detail_state.dart';
import 'package:smart_campus/module/message/message_detail/message_detail_view.dart';

import 'message_state.dart';

class MessageLogic extends GetxController {
  final MessageState state = MessageState();

  @override
  void onReady() {
    super.onReady();
    state.showTopics = newsDetailBeanFromJson(newsDetailBeanToJson(topics));
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
    state.showTopics.clear();
    for (TopicBean data in topics) {
      if (data.type == index || index == 0) {
        state.showTopics.add(data);
      }
    }
  }

  void toDetail(TopicBean data) {
    Get.to(MessageDetailPage(), arguments: {
      MessageDetailState.keyData: data,
    });
  }

  void onLike(TopicBean bean) {
    bean.isLike = !(bean.isLike ?? false);
    if (bean.isLike!) {
      bean.likeCount = bean.likeCount! + 1;
    } else {
      bean.likeCount = bean.likeCount! - 1;
    }
    update();
  }

  void onSearch() {
    if (StringUtils.isEmpty(state.searchController.text )) {
      ToastUtil.showToast('请输入搜索内容');
    }
    SmartDialog.showLoading();
    Timer(const Duration(seconds: 1), () => SmartDialog.dismiss());
    state.showTopics.clear();
    for (TopicBean data in topics) {
      if (data.title!.contains(state.searchController.text )) {
        state.showTopics.add(data);
      }
    }
    update();
  }

  void addMessage() {

    Get.to(AddMessagePage());
  }
}
