import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/common/bind_widget/get_bind_widget.dart';
import '../../../../app/common/text/text_style.dart';
import '../../../../app/common/widget/common_divider_line.dart';
import '../../../../app/common/widget/common_text_app_bar.dart';
import 'notify_detail_logic.dart';

class NotifyDetailPage extends StatelessWidget {
  final logic = Get.put(NotifyDetailLogic());
  final state = Get.find<NotifyDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotifyDetailLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildAuthorDate(),
        _buildContent(),

      ]);
    });
  }
  Widget _buildContent() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '通知内容',
            style: CommonTextStyle.blackFont18,
          ),
          CommonDividerLine(
            padding: EdgeInsets.symmetric(vertical: 5),
            height: 2,
          ),

          SizedBox(
            height: 10,
          ),
          Text(
            state.data.content ?? '',
            style: CommonTextStyle.blackFont18,
          ),
        ],
      ),
    );
  }
  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '通知详情',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }
  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(
        state.data.title ?? '',
        style: CommonTextStyle.blackFont24bold,
      ),
    );
  }
  Widget _buildAuthorDate() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '时间： ${state.data.time ?? ''}',
            style: CommonTextStyle.blueFont18Bold,
          ),
          Text(
            '学院： ${state.data.unit ?? ''}',
            style: CommonTextStyle.blueFont18Bold,
          ),
        ],
      ),
    );
  }
}
