import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/input/input_text.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/common/widget/common_text_app_bar.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/module/home/notify/widget/notice_detail_card_widget.dart';

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
            child: const InputText(
              hintSize: 16,
              hintText: '请输入搜索条件',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              //todo
            },
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
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CommonImage(
                    ImageCommon.filter,
                    width: 20,
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      '筛选',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNoticeList() {
    return Expanded(
      child: EasyRefresh(
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        child: const NoticeDetailCardWidget(),
      ),
    );
  }
}
