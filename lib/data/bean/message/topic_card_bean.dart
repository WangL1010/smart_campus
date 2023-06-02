// To parse this JSON data, do
//
//     final topicBean = topicBeanFromJson(jsonString);

import 'dart:convert';

List<TopicBean> newsDetailBeanFromJson(String str) => List<TopicBean>.from(json.decode(str).map((x) => TopicBean.fromJson(x)));

String newsDetailBeanToJson(List<TopicBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class TopicBean {
  int? id;
  String? userAvatar;
  String? typeName;
  String? userNickname;
  String? title;
  String? content;
  List<String>? imageList;
  int? likeCount;
  int? type;
  bool? isLike;
  TopicBean({
    this.id,
    this.userAvatar,
    this.userNickname,
    this.title,
    this.content,
    this.imageList,
    this.likeCount,
    this.type,
    this.isLike=false,
    this.typeName,
  });

  factory TopicBean.fromJson(Map<String, dynamic> json) => TopicBean(
    id: json["id"],
    userAvatar: json["user_avatar"],
    userNickname: json["user_nickname"],
    title: json["title"],
    content: json["content"],
    imageList: json["image_list"] == null ? [] : List<String>.from(json["image_list"]!.map((x) => x)),
    likeCount: json["like_count"],
    type: json["type"],
    isLike: json["isLike"],
    typeName: json["typeName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_avatar": userAvatar,
    "user_nickname": userNickname,
    "title": title,
    "content": content,
    "image_list": imageList == null ? [] : List<dynamic>.from(imageList!.map((x) => x)),
    "like_count": likeCount,
    "type": type,
    "isLike": isLike,
    "typeName": typeName,
  };
}
