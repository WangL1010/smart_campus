import 'package:smart_campus/data/bean/common/filter_info.dart';

class MessageState {
  //类型选项
  late List<FilterInfo> filterType;
  FilterInfo? curType;

  MessageState() {
    filterType = [
      FilterInfo(name: '学习', tag: '1'),
      FilterInfo(name: '生活', tag: '2'),
      FilterInfo(name: '运动', tag: '3'),
    ];
  }
}
