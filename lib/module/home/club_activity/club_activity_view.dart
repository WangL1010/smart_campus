import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:smart_campus/app/common/bind_widget/get_bind_widget.dart';
import 'package:smart_campus/app/common/function/function.dart';
import 'package:smart_campus/app/common/input/input_text.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/common/widget/common_text_app_bar.dart';
import 'package:smart_campus/module/home/club_activity/widget/activity_info_widget.dart';

import '../../../app/config/images/image_common.dart';
import '../../../data/bean/home/club_activity_bean.dart';
import 'club_activity_logic.dart';

class ClubActivityPage extends StatelessWidget {
  final logic = Get.put(ClubActivityLogic());
  final state = Get.find<ClubActivityLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClubActivityLogic>(builder: (logic) {
      return _buildBg(children: [
        _buildInputSearch(),
        _buildFilterSearch(),
        _buildActivityList(),
      ]);
    });
  }

  Widget _buildBg({required List<Widget> children}) {
    return GetBindWidget(
        bind: logic,
        child: CommonTextAppBar(
          title: '社团活动',
          body: Column(
            children: [
              ...children,
            ],
          ),
        ));
  }

  Widget _buildInputSearch() {
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
            child: InputText(
              controller: state.searchController,
              hintSize: 16,
              hintText: '请输入搜索条件',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => logic.onSeach(),
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
            onTap: ()=>logic.addActivity(),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CommonImage(
                    ImageCommon.publish,
                    width: 20,
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      '发布',
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

  Widget _buildFilterSearch() {
    return Container(
      color: Colors.white,
      height: 40,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          _buildFilterItem(
              title: state.curType?.name ?? '社团',
              onTap: () => logic.onSelectType()),
          Spacer(),
          _buildFilterItem(
              title: state.curJoin?.name ?? '是否参加',
              onTap: () => logic.onSelectJoin()),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildFilterItem({
    required String title,
    required ParamVoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Container(
        child: Row(
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
      ),
    );
  }

  Widget _buildActivityList() {
    List<Widget> widgets = [];
    for (ClubActivityBean data in state.shows) {
      widgets.add(ActivityInfoWidget(
        data: data,
        onTap: (info) => logic.toDetail(info),
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
