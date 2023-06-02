// To parse this JSON data, do
//
//     final competitionBean = competitionBeanFromJson(jsonString);

import 'dart:convert';

List<CompetitionBean> competitionBeanFromJson(String str) => List<CompetitionBean>.from(json.decode(str).map((x) => CompetitionBean.fromJson(x)));

String competitionBeanToJson(List<CompetitionBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompetitionBean {
  int? competitionId;
  String? competitionName;
  String? publishTime;
  String? location;
  String? eventTime;
  String? eventContent;
  String? registrationDeadline;
  String? eventLevel;
  String? relatedCollege;
  int? eventLevelType;
  int? collegeType;

  CompetitionBean({
    this.competitionId,
    this.competitionName,
    this.publishTime,
    this.location,
    this.eventTime,
    this.eventContent,
    this.registrationDeadline,
    this.eventLevel,
    this.relatedCollege,
    this.eventLevelType,
    this.collegeType,
  });

  factory CompetitionBean.fromJson(Map<String, dynamic> json) => CompetitionBean(
    competitionId: json["competition_id"],
    competitionName: json["competition_name"],
    publishTime: json["publish_time"],
    location: json["location"],
    eventTime: json["event_time"],
    eventContent: json["event_content"],
    registrationDeadline: json["registration_deadline"],
    eventLevel: json["event_level"],
    relatedCollege: json["related_college"],
    eventLevelType: json["event_level_type"],
     collegeType: json["collegeType"],
  );

  Map<String, dynamic> toJson() => {
    "competition_id": competitionId,
    "competition_name": competitionName,
    "publish_time": publishTime,
    "location": location,
    "event_time": eventTime,
    "event_content": eventContent,
    "registration_deadline": registrationDeadline,
    "event_level": eventLevel,
    "related_college": relatedCollege,
    "event_level_type": eventLevelType,
    "collegeType": collegeType,
  };
}
