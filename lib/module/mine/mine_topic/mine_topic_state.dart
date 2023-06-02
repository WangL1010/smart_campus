import 'package:smart_campus/module/message/message_state.dart';

import '../../../data/bean/message/topic_card_bean.dart';

class MineTopicState {
  late List<TopicBean> showTopics=[];
  MineTopicState() {
    showTopics.add(topics.first);
  }
}
