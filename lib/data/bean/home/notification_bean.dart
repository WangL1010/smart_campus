// To parse this JSON data, do
//
//     final notificationBean = notificationBeanFromJson(jsonString);

import 'dart:convert';

NotificationBean notificationBeanFromJson(String str) => NotificationBean.fromJson(json.decode(str));

String notificationBeanToJson(NotificationBean data) => json.encode(data.toJson());

class NotificationBean {
  int? id;
  bool? isRead;
  String? title;
  String? unit;
  String? content;
  DateTime? time;

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
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isRead": isRead,
    "title": title,
    "unit": unit,
    "content": content,
    "time": time?.toIso8601String(),
  };
}
