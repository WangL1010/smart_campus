import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/data/bean/home/news_detail_bean.dart';

class HomeState {
  late List<NewsDetailBean> showNews;
  late EasyRefreshController refreshController;

  HomeState() {
    refreshController = EasyRefreshController();
    showNews = [];

    ///Initialize variables
  }
}

List<NewsDetailBean> newsList = [
  NewsDetailBean(
    id: 1,
    title: '校庆活动即将举行',
    content: '今年是我校建校50周年，校庆活动将于下个月举行。',
    publishDate: '2023-05-15 00:00:00',
    author: '张三',
    college: '学院A',
    coverImageUrl: ImageCommon.loop_image_1,
  ),
  NewsDetailBean(
    id: 2,
    title: '招聘会通知',
    content: '学校将举行招聘会，请各位同学提前准备简历和面试技巧。',
    publishDate: '2023-06-01 10:00:00',
    author: '李四',
    college: '学院B',
    coverImageUrl: ImageCommon.loop_image_2,
  ),
  NewsDetailBean(
    id: 3,
    title: '实验室开放日',
    content: '本周五实验室将举行开放日活动，欢迎同学们前来参观。',
    publishDate: '2023-07-12 14:00:00',
    author: '王五',
    college: '学院C',
    coverImageUrl: ImageCommon.loop_image_3,
  ),
  NewsDetailBean(
    id: 4,
    title: '学术讲座通知',
    content: '本周末将有一场关于人工智能的学术讲座，欢迎对此感兴趣的同学参加。',
    publishDate: '2023-08-20 18:30:00',
    author: '赵六',
    college: '学院D',
    coverImageUrl: ImageCommon.loop_image_1,
  ),
  NewsDetailBean(
    id: 5,
    title: '暑期实习机会',
    content: '学校与多家知名企业合作，提供丰富的暑期实习机会，请有意向的同学尽快报名。',
    publishDate: '2023-09-05 09:00:00',
    author: '钱七',
    college: '学院E',
    coverImageUrl: ImageCommon.loop_image_2,
  ),
];
