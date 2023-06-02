import 'package:flutter/material.dart';

import '../../../data/bean/common/filter_info.dart';
import '../../../data/bean/home/club_activity_bean.dart';

class ClubActivityState {
  late List<FilterInfo> filterType;
  FilterInfo? curType;
  late List<FilterInfo> filterJoin;
  FilterInfo? curJoin;
  late List<ClubActivityBean> shows;
  late TextEditingController searchController;

  ClubActivityState() {
    shows = [];
    filterType = [
      FilterInfo(name: '全部', tag: '0'),
      FilterInfo(name: '羽毛球社', tag: '1'),
      FilterInfo(name: '篮球社', tag: '2'),
      FilterInfo(name: '足球社', tag: '3'),
    ];
    filterJoin = [
      FilterInfo(name: '全部', tag: '0'),
      FilterInfo(name: '已参加', tag: '1'),
      FilterInfo(name: '未参加', tag: '2'),
    ];
    searchController = TextEditingController();
  }
}

List<ClubActivityBean> testCases = [
  ClubActivityBean(
    isJoin: 1,
    activityId: 1,
    clubId: 2,
    clubName: "篮球俱乐部",
    activityTime: "2023-05-10 18:00:00",
    activityPlace: "篮球场",
    activityContent: "篮球友谊赛，欢迎所有篮球爱好者参加！",
    activityCapacity: 50,
    publishTime: "2023-04-25 09:30:00",
  ),
  ClubActivityBean(
    isJoin: 2,
    activityId: 2,
    clubId: 3,
    clubName: "足球俱乐部",
    activityTime: "2023-05-15 16:00:00",
    activityPlace: "足球场",
    activityContent: "足球友谊赛，欢迎所有足球爱好者参加！",
    activityCapacity: 40,
    publishTime: "2023-04-30 14:00:00",
  ),
  ClubActivityBean(
    isJoin: 2,
    activityId: 3,
    clubId: 1,
    clubName: "羽毛球俱乐部",
    activityTime: "2023-05-20 19:00:00",
    activityPlace: "羽毛球馆",
    activityContent: "羽毛球训练班，欢迎所有对羽毛球感兴趣的人报名！",
    activityCapacity: 20,
    publishTime: "2023-05-05 10:30:00",
  ),
];
