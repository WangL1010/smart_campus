import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/input/input_text.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/common/widget/common_text_app_bar.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/module/home/notify/widget/notice_detail_card_widget.dart';

import '../../../data/bean/home/notification_bean.dart';
import 'notify_logic.dart';

///通知页面
class NotifyPage extends StatelessWidget {
  final logic = Get.put(NotifyLogic());
  final state = Get.find<NotifyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotifyLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildFilterSearch(),
        _buildNoticeList(),
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '通知',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }

  Widget _buildFilterSearch() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child:  InputText(
              controller: state.searchController,
              hintSize: 16,
              hintText: '请输入搜索条件',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () =>logic.onSearch(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: const Text(
                '搜索',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildNoticeList() {
    List<Widget> widgets = [];
    for (NotificationBean data in state.showNotify) {
      widgets.add(NoticeDetailCardWidget(
        data: data,
        onTap:(info) =>logic.toDetail(info),
      ));
    }
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...widgets,
          ],
        ),
      ),
    );
  }
}
