// To parse this JSON data, do
//
//     final newsDetailBean = newsDetailBeanFromJson(jsonString);

import 'dart:convert';

List<TopicCardBean> newsDetailBeanFromJson(String str) => List<TopicCardBean>.from(json.decode(str).map((x) => TopicCardBean.fromJson(x)));

String newsDetailBeanToJson(List<TopicCardBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopicCardBean {
  TopicCardBean({
    this.nickname,
    this.avatarUrl,
    this.title,
    this.previewContent,
    this.likesCount,
  });

  String? nickname;
  String? avatarUrl;
  String? title;
  String? previewContent;
  int? likesCount;

  factory TopicCardBean.fromJson(Map<String, dynamic> json) => TopicCardBean(
    nickname: json["nickname"],
    avatarUrl: json["avatarUrl"],
    title: json["title"],
    previewContent: json["previewContent"],
    likesCount: json["likesCount"],
  );

  Map<String, dynamic> toJson() => {
    "nickname": nickname,
    "avatarUrl": avatarUrl,
    "title": title,
    "previewContent": previewContent,
    "likesCount": likesCount,
  };
}
