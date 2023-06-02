import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/function/function.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_divider_line.dart';

import '../../../../data/bean/home/club_activity_bean.dart';

class ActivityInfoWidget extends StatelessWidget {
  const ActivityInfoWidget({Key? key, required this.data, required this.onTap}) : super(key: key);
 final ClubActivityBean data;
 final ParamSingleCallback<ClubActivityBean> onTap;
  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      _buildTitle(),
      const CommonDividerLine(
        padding: EdgeInsets.symmetric(vertical: 2),
      ),
      _buildItemContent(title: '活动地点', content: data.activityPlace??''),
      _buildItemContent(title: '活动时间', content: data.activityTime??''),
      _buildItemContent(title: '活动内容', content: data.activityContent??''),
      _buildItemContent(title: '活动人数', content: '${data.activityCapacity??0}'),
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
          '社团名称',
          style: CommonTextStyle.blackFont12,
        ),
        Text(
          data.clubName??'',
          style: CommonTextStyle.blackFont10,
        ),
      ],
    );
  }

  Widget _buildBtn() {
    return GestureDetector(
      onTap: ()=>onTap.call(data),
      child: Container(
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
      ),
    );
  }
}
