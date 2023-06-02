import 'package:get/get.dart';
import 'package:smart_campus/data/bean/message/topic_card_bean.dart';

import '../../message/message_detail/message_detail_state.dart';
import '../../message/message_detail/message_detail_view.dart';
import 'mine_topic_state.dart';

class MineTopicLogic extends GetxController {
  final MineTopicState state = MineTopicState();

  void toDetail(TopicBean data) {
    Get.to(MessageDetailPage(), arguments: {
      MessageDetailState.keyData: data,
    });
  }
}
