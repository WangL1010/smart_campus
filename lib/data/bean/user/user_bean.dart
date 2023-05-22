// To parse this JSON data, do
//
//     final userBean = userBeanFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

UserBean userBeanFromJson(String str) => UserBean.fromJson(json.decode(str));

String userBeanToJson(UserBean data) => json.encode(data.toJson());

class UserBean {
  Long? id;
  String? name;
  String? userphone;
  String? password;
  Long? schoolId;
  String? schoolName;
  String? studentId;

  UserBean({
    this.id,
    this.name,
    this.userphone,
    this.password,
    this.schoolId,
    this.schoolName,
    this.studentId,
  });

  factory UserBean.fromJson(Map<String, dynamic> json) => UserBean(
    id: json["id"],
    name: json["name"],
    userphone: json["userphone"],
    password: json["password"],
    schoolId: json["schoolId"],
    schoolName: json["schoolName"],
    studentId: json["studentId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "userphone": userphone,
    "password": password,
    "schoolId": schoolId,
    "schoolName": schoolName,
    "studentId": studentId,
  };
}
