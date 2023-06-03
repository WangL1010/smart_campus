import 'package:flutter/material.dart';

import '../../../../data/bean/common/filter_info.dart';

class AddActivityState {
  late TextEditingController nameController;
  late TextEditingController placeController;
  late TextEditingController contentController;
  late TextEditingController activityTimeController;
  late List<FilterInfo> filterType;
  FilterInfo? curType;
  AddActivityState() {
    nameController=TextEditingController();
    placeController=TextEditingController();
    contentController=TextEditingController();
    activityTimeController=TextEditingController();
    filterType = [
      FilterInfo(name: '羽毛球社', tag: '1'),
      FilterInfo(name: '篮球社', tag: '2'),
      FilterInfo(name: '足球社', tag: '3'),
    ];
    curType = filterType.first;
    ///Initialize variables
  }


}
