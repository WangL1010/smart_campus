import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/dialog/pop/popup_route.dart';
import 'package:smart_campus/app/common/dialog/top/list/top_list_dialog.dart';
import 'package:smart_campus/app/common/function/function.dart';



class TopDialog {
  ///顶部弹窗,统一调用
  static showList<T>(
    BuildContext context, {
    Duration duration = const Duration(milliseconds: 300),
    required List<T> list,
    required ParamSingleCallback<T> callback,
    String showKey = '',
    T? selected,
  }) {
    ///处理下数据源
    List<String> topList = [];
    String? selectedString;
    if (selected != null) {
      selectedString = showKey == ''
          ? selected as String
          : json.decode(jsonEncode(selected))[showKey];
    }
    //数据源
    for (T item in list) {
      String showContent;
      if (showKey == '') {
        //兼容泛型为String的情况
        showContent = item as String;
      } else {
        //将实体转成map，通过设置的key指定展示的字段
        dynamic map = json.decode(jsonEncode(item));
        showContent = map[showKey];
      }
      topList.add(showContent);
    }

    Navigator.push(
      context,
      EasyPopupRoute(
        child: TopListDialog(
          data: topList,
          selectedString: selectedString,
          onTap: (int index) => callback(list[index]),
        ),
        duration: duration,
      ),
    );
  }
}
