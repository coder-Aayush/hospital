// To parse this JSON data, do
//
//     final hosptial = hosptialFromJson(jsonString);

import 'dart:convert';

List<Hospital> hosptialFromJson(String str) =>
    List<Hospital>.from(json.decode(str).map((x) => Hospital.fromJson(x)));

String hosptialToJson(List<Hospital> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hospital {
  Hospital({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
