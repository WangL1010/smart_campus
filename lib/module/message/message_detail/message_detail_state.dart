import 'package:get/get.dart';
import 'package:smart_campus/data/bean/message/topic_card_bean.dart';

class MessageDetailState {
  static String keyData = 'keyData';
  late TopicBean topicBean;

  MessageDetailState() {
    topicBean = TopicBean();
  }

  void configData() {
    var arguments = Get.arguments;
    if (arguments == null) {
      return;
    }
    topicBean = arguments[keyData];
  }
}
