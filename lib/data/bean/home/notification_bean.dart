// To parse this JSON data, do
//
//     final notificationBean = notificationBeanFromJson(jsonString);

import 'dart:convert';


List<NotificationBean> notificationBeanFromJson(String str) => List<NotificationBean>.from(json.decode(str).map((x) => NotificationBean.fromJson(x)));

String notificationBeanToJson(List<NotificationBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationBean {
  int? id;
  bool? isRead;
  String? title;
  String? unit;
  String? content;
  String? time;

  NotificationBean({
    this.id,
    this.isRead,
    this.title,
    this.unit,
    this.content,
    this.time,
  });

  factory NotificationBean.fromJson(Map<String, dynamic> json) => NotificationBean(
    id: json["id"],
    isRead: json["isRead"],
    title: json["title"],
    unit: json["unit"],
    content: json["content"],
    time: json["time"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isRead": isRead,
    "title": title,
    "unit": unit,
    "content": content,
    "time": time,
  };
}
