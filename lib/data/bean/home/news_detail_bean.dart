// To parse this JSON data, do
//
//     final newsDetailBean = newsDetailBeanFromJson(jsonString);

import 'dart:convert';

List<NewsDetailBean> newsDetailBeanFromJson(String str) => List<NewsDetailBean>.from(json.decode(str).map((x) => NewsDetailBean.fromJson(x)));

String newsDetailBeanToJson(List<NewsDetailBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsDetailBean {
  NewsDetailBean({
    this.newsId,
    this.itemImageUrl,
    this.itemTitle,
    this.newsTime,
    this.content,
  });

  int? newsId;
  String? itemImageUrl;
  String? itemTitle;
  String? newsTime;
  String? content;

  factory NewsDetailBean.fromJson(Map<String, dynamic> json) => NewsDetailBean(
    newsId: json["newsID"],
    itemImageUrl: json["itemImageUrl"],
    itemTitle: json["itemTitle"],
    newsTime: json["newsTime"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "newsID": newsId,
    "itemImageUrl": itemImageUrl,
    "itemTitle": itemTitle,
    "newsTime": newsTime,
    "content": content,
  };
}
