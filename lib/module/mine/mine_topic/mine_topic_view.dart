import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/module/mine/mine_topic/widget/topic_detail_card.dart';

import '../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../app/common/widget/common_text_app_bar.dart';
import '../../../data/bean/message/topic_card_bean.dart';
import 'mine_topic_logic.dart';

class MineTopicPage extends StatelessWidget {
  final logic = Get.put(MineTopicLogic());
  final state = Get.find<MineTopicLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineTopicLogic>(builder: (logic) {
      List<Widget> widgets = [];
      for (TopicBean temp in state.showTopics) {
        widgets.add(TopicDetailCard(
          data: temp,
          onTap: (info) => logic.toDetail(info),
        ));
      }
      return _buildBg(children: [
        ...widgets,
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '我的发布',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }
}
