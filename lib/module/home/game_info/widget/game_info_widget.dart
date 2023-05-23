import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_divider_line.dart';

class GameInfoWidget extends StatelessWidget {
  const GameInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      _buildTitle(),
      const CommonDividerLine(
        height: 3,
        padding: EdgeInsets.symmetric(vertical: 2),
      ),
      _buildItemContent(title: '比赛地点', content: '甘怡'),
      _buildItemContent(title: '比赛时间', content: '甘怡'),
      _buildItemContent(title: '比赛内容', content: '甘怡'),
      _buildItemContent(title: '比赛人数', content: '甘怡'),
      _buildBtn(),
    ]);
  }

  Widget _buildItemContent({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ,
            style: CommonTextStyle.blackFont10,
          ),
          Text(
            content ,
            style: CommonTextStyle.blackFont10,
          ),
        ],
      ),
    );
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ...children,
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '比赛名称',
          style: CommonTextStyle.blackFont12,
        ),
        Text(
          '2023-05-06',
          style: CommonTextStyle.blackFont10,
        ),
      ],
    );
  }

  Widget _buildBtn() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '详情',
              style: CommonTextStyle.whiteFont10,
            ),
          ),
        ],
      ),
    );
  }
}
