// To parse this JSON data, do
//
//     final newsDetailBean = newsDetailBeanFromJson(jsonString);

import 'dart:convert';

List<NewsDetailBean> newsDetailBeanFromJson(String str) => List<NewsDetailBean>.from(json.decode(str).map((x) => NewsDetailBean.fromJson(x)));

String newsDetailBeanToJson(List<NewsDetailBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsDetailBean {
  NewsDetailBean({
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

  factory NewsDetailBean.fromJson(Map<String, dynamic> json) => NewsDetailBean(
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
