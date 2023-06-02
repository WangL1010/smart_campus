import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../data/bean/common/filter_info.dart';

class AddMessageState {
  List<AssetEntity>? result;
  late TextEditingController titleController;
  late TextEditingController contentController;
  late List<FilterInfo> filterType;
  FilterInfo? curType;

  AddMessageState() {
    result = [];
    titleController = TextEditingController();
    contentController = TextEditingController();
    filterType = [
      FilterInfo(name: '学习', tag: '1'),
      FilterInfo(name: '生活', tag: '2'),
      FilterInfo(name: '运动', tag: '3'),
    ];
    curType = filterType.first;

    ///Initialize variables
  }
}
