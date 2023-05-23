import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/function/function.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/module/home/game_info/widget/game_info_widget.dart';

import '../../../app/common/widget/common_text_app_bar.dart';
import 'game_info_logic.dart';

class GameInfoPage extends StatelessWidget {
  final logic = Get.put(GameInfoLogic());
  final state = Get.find<GameInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameInfoLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildFilterSearch(),
        _buildGameInfoList(),
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '比赛信息',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }

  Widget _buildFilterSearch() {
    return Container(
      color: Colors.white,
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          _buildFilterItem(title: '学院', onTap: () {}),
          Spacer(),
          _buildFilterItem(title: '级别', onTap: () {}),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildFilterItem({
    required String title,
    required ParamVoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: CommonTextStyle.blackFont12,
          ),
          const Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.black,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildGameInfoList() {
    return Expanded(
      child: EasyRefresh(
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        child: const GameInfoWidget(),
      ),
    );
  }
}
