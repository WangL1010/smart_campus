// To parse this JSON data, do
//
//     final clubActivityBean = clubActivityBeanFromJson(jsonString);

import 'dart:convert';

List<ClubActivityBean> clubActivityBeanFromJson(String str) => List<ClubActivityBean>.from(json.decode(str).map((x) => ClubActivityBean.fromJson(x)));

String clubActivityBeanToJson(List<ClubActivityBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClubActivityBean {
  int? activityId;
  int? clubId;
  int? isJoin;
  String? clubName;
  String? activityTime;
  String? activityPlace;
  String? activityContent;
  int? activityCapacity;
  String? publishTime;

  ClubActivityBean({
    this.activityId,
    this.clubId,
    this.isJoin,
    this.clubName,
    this.activityTime,
    this.activityPlace,
    this.activityContent,
    this.activityCapacity,
    this.publishTime,
  });

  factory ClubActivityBean.fromJson(Map<String, dynamic> json) => ClubActivityBean(
    activityId: json["activityId"],
    clubId: json["clubId"],
    isJoin: json["isJoin"],
    clubName: json["clubName"],
    activityTime: json["activityTime"],
    activityPlace: json["activityPlace"],
    activityContent: json["activityContent"],
    activityCapacity: json["activityCapacity"],
    publishTime: json["publishTime"],
  );

  Map<String, dynamic> toJson() => {
    "activityId": activityId,
    "clubId": clubId,
    "isJoin": isJoin,
    "clubName": clubName,
    "activityTime": activityTime,
    "activityPlace": activityPlace,
    "activityContent": activityContent,
    "activityCapacity": activityCapacity,
    "publishTime": publishTime,
  };
}
