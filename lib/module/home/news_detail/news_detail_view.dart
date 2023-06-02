import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_divider_line.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/common/widget/common_text_app_bar.dart';

import 'news_detail_logic.dart';

class NewsDetailPage extends StatelessWidget {
  final logic = Get.put(NewsDetailLogic());
  final state = Get.find<NewsDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDetailLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildTitle(),
        _buildAuthorDate(),
        _buildContent(),
        _buildTime(),
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '新闻详情',
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
        state.detailBean.title ?? '',
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
            '作者： ${state.detailBean.author ?? ''}',
            style: CommonTextStyle.blackFont10,
          ),
          Text(
            '学院： ${state.detailBean.college ?? ''}',
            style: CommonTextStyle.blackFont10,
          ),
        ],
      ),
    );
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
            '新闻内容',
            style: CommonTextStyle.blackFont18,
          ),
          CommonDividerLine(
            padding: EdgeInsets.symmetric(vertical: 5),
            height: 2,
          ),
          SizedBox(
            height: 10,
          ),
          CommonImage(
            state.detailBean.coverImageUrl ?? '',
            width: 300,
            height: 140,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            state.detailBean.content ?? '',
            style: CommonTextStyle.blackFont12,
          ),
        ],
      ),
    );
  }

  Widget _buildTime() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '创作时间： ${state.detailBean.publishDate ?? ''}',
            style: CommonTextStyle.blackFont12,
          ),
        ],
      ),
    );
  }
}
