import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';

import '../../../app/common/widget/common_text_app_bar.dart';
import 'game_info_logic.dart';

class GameInfoPage extends StatelessWidget {
  final logic = Get.put(GameInfoLogic());
  final state = Get.find<GameInfoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameInfoLogic>(builder: (logic) {
      return _buildBg(children: [


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
}
