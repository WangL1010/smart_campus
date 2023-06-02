import 'package:flutter/material.dart';
import 'package:smart_campus/data/bean/home/notification_bean.dart';

class NotifyState {
  late List<NotificationBean> showNotify;
  late TextEditingController searchController;

  NotifyState() {
    showNotify = [];
    searchController = TextEditingController();
  }
}

List<NotificationBean> notifications = [
  NotificationBean(
    id: 1,
    isRead: true,
    title: '校园运动会通知',
    unit: '体育协会',
    content: '各位同学，我校即将举行年度校园运动会，届时将有各项运动项目的比赛活动，希望广大同学踊跃报名参加，展现青春活力和体育风采。',
    time: '2023-10-20',
  ),
  NotificationBean(
    id: 2,
    isRead: false,
    title: '学生会换届选举通知',
    unit: '学生会',
    content:
        '亲爱的同学们，学生会即将进行换届选举，请有意向参与学生会工作的同学们积极报名参选，并在指定时间参加候选人宣讲会，为大家展示自己的理念和才能。',
    time: '2023-10-20',
  ),
  NotificationBean(
    id: 3,
    isRead: false,
    title: '学术讲座通知',
    unit: '教务处',
    content:
        '本学期学术讲座活动将在下周举行，邀请了知名学者作为讲座嘉宾，内容涵盖多个学科领域，欢迎广大师生踊跃参与，共同探讨学术热点和前沿问题。',
    time: '2023-10-20',
  ),
  NotificationBean(
    id: 4,
    isRead: true,
    title: '紧急停水通知',
    unit: '后勤保障部',
    content: '由于水管维修工程需要，学校将于明天上午9点至下午5点进行紧急停水，期间请大家合理安排用水，做好储备工作，确保生活正常进行。',
    time: '2023-10-20',
  ),
  NotificationBean(
    id: 5,
    isRead: true,
    title: '学校寒假放假通知',
    unit: '教务处',
    content:
        '根据学校安排，寒假放假时间将从明天开始，为期三周，学校将提供安全有序的离校服务，希望同学们能够安全回家或参加相关假期活动，做好假期安排。假期结束后，请准时返校。',
    time: '2023-10-20',
  ),
];
