// To parse this JSON data, do
//
//     final newsDetailBean = newsDetailBeanFromJson(jsonString);

import 'dart:convert';

NewsDetailBean newsDetailBeanFromJson(String str) => NewsDetailBean.fromJson(json.decode(str));

String newsDetailBeanToJson(NewsDetailBean data) => json.encode(data.toJson());

class NewsDetailBean {
  int? id;
  String? title;
  String? content;
  String? publishDate;
  String? author;
  String? college;
  String? coverImageUrl;

  NewsDetailBean({
    this.id,
    this.title,
    this.content,
    this.publishDate,
    this.author,
    this.college,
    this.coverImageUrl,
  });

  factory NewsDetailBean.fromJson(Map<String, dynamic> json) => NewsDetailBean(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    publishDate:  json["publishDate"],
    author: json["author"],
    college: json["college"],
    coverImageUrl: json["cover_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "publishDate": publishDate,
    "author": author,
    "college": college,
    "cover_image_url": coverImageUrl,
  };
}
