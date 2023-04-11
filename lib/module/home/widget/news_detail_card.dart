import 'package:flutter/material.dart';
import 'package:smart_campus/app/common/function/function.dart';
import 'package:smart_campus/app/common/text/text_style.dart';
import 'package:smart_campus/app/common/widget/common_image_widget.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/data/bean/home/news_detail_bean.dart';

class NewsDetailCard extends StatelessWidget {
  const NewsDetailCard({
    Key? key,
    this.newsDetail,
    this.onTap,
  }) : super(key: key);

  //数据源
  final NewsDetailBean? newsDetail;

  final ParamVoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      _buildImage(),
      _buildContent(),
    ]);
  }

  Widget _buildBg({required List<Widget> children}) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      child: CommonImage(
        newsDetail?.itemImageUrl??'',
        width: 200,
        height: 100,
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              newsDetail?.itemTitle??'',
              style: CommonTextStyle.blackFont28,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  CommonImage(
                    ImageCommon.date,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 2,),
                  Text(
                    newsDetail?.newsTime??'',
                    style: CommonTextStyle.blackFont24,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
