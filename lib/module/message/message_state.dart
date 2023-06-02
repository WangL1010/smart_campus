import 'package:flutter/material.dart';
import 'package:smart_campus/app/config/images/image_common.dart';
import 'package:smart_campus/data/bean/common/filter_info.dart';
import 'package:smart_campus/data/bean/message/topic_card_bean.dart';

class MessageState {
  //类型选项
  late List<FilterInfo> filterType;
  FilterInfo? curType;
  late List<TopicBean> showTopics;
  late TextEditingController searchController;

  MessageState() {
    showTopics = [];
    filterType = [
      FilterInfo(name: '全部', tag: '0'),
      FilterInfo(name: '学习', tag: '1'),
      FilterInfo(name: '生活', tag: '2'),
      FilterInfo(name: '运动', tag: '3'),
    ];
    searchController = TextEditingController();
  }
}

List<TopicBean> topics = [
  TopicBean(
      type: 1,
      id: 1,
      userAvatar: ImageCommon.person,
      userNickname: '王龙',
      title: '探索编程世界',
      content: '大家好！我是一个热爱学习编程的小伙伴，最近我开始了自学编程的旅程，探索着无限可能的编程世界。学习各种编程语言和技术，我意识到编程不仅仅是一门技能，更是一种思维方式。通过编程，我可以创造出各种有趣和有用的应用程序。希望和对编程感兴趣的小伙伴们一起分享学习心得，一起探索编程的奥秘！',
      imageList: [
        ImageCommon.loop_image_2,
        ImageCommon.loop_image_2,
        ImageCommon.loop_image_1,
      ],
      likeCount: 10,
      typeName: '学习'),
  TopicBean(
      type: 2,
      id: 2,
      userAvatar: ImageCommon.person,
      userNickname: '用户2',
      title: '探索美食之旅',
      content: '大家好！我是一个热爱美食的小伙伴，最近我在城市中探索了许多美食宝藏。从小吃摊到高档餐厅，我尝试了各种各样的美食，品尝了各地的特色菜肴。让我印象深刻的是那家隐藏在巷子里的小面馆，那里的牛肉面简直是绝品！大家有没有什么推荐的美食店铺呢？一起来分享你们的美食探险吧！',
      imageList: [
        ImageCommon.loop_image_2,
        ImageCommon.loop_image_1,
      ],
      likeCount: 5,
      typeName: '生活'),
  TopicBean(
      type: 3,
      id: 3,
      userAvatar: ImageCommon.person,
      userNickname: '用户3',
      title: '健身让生活更精彩',
      content: '大家好！我是一个热爱运动的小伙伴，最近我开始了健身之旅，发现健身不仅仅是锻炼身体，更是一种生活态度。每天的跑步、举重和瑜伽让我感觉焕然一新，不仅身体变得更加强壮和灵活，心情也更加愉悦。希望和喜欢运动的小伙伴们一起交流经验，分享健身的乐趣和成果！',
      imageList: [
        ImageCommon.loop_image_2,
        ImageCommon.loop_image_1,
      ],
      likeCount: 2,
      typeName: '运动'),
  TopicBean(
      type: 1,
      id: 4,
      userAvatar: ImageCommon.person,
      userNickname: '用户4',
      title: '探索编程世界',
      content: '大家好！我是一个热爱学习编程的小伙伴，最近我开始了自学编程的旅程，探索着无限可能的编程世界。学习各种编程语言和技术，我意识到编程不仅仅是一门技能，更是一种思维方式。通过编程，我可以创造出各种有趣和有用的应用程序。希望和对编程感兴趣的小伙伴们一起分享学习心得，一起探索编程的奥秘！',
      imageList: [
        ImageCommon.loop_image_2,
        ImageCommon.loop_image_1,
      ],
      likeCount: 8,
      typeName: '学习'),
  TopicBean(
      type: 2,
      id: 5,
      userAvatar: ImageCommon.person,
      userNickname: '用户5',
      title: '话题标题5',
      content: '这是话题5的内容，至少需要50个字才能满足要求。这里可以写一些有关话题的详细信息和描述，用于引起其他用户的关注和讨论。',
      imageList: [
        ImageCommon.loop_image_2,
        ImageCommon.loop_image_1,
      ],
      likeCount: 3,
      typeName: '生活'),
];
