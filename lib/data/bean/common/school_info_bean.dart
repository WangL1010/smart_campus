// To parse this JSON data, do
//
//     final schoolInfo = schoolInfoFromJson(jsonString);

import 'dart:convert';

SchoolInfo schoolInfoFromJson(String str) => SchoolInfo.fromJson(json.decode(str));

String schoolInfoToJson(SchoolInfo data) => json.encode(data.toJson());

class SchoolInfo {
  String? schoolName;
  int? schoolId;

  SchoolInfo({
    this.schoolName,
    this.schoolId,
  });

  factory SchoolInfo.fromJson(Map<String, dynamic> json) => SchoolInfo(
    schoolName: json["schoolName"],
    schoolId: json["schoolId"],
  );

  Map<String, dynamic> toJson() => {
    "schoolName": schoolName,
    "schoolId": schoolId,
  };
}
