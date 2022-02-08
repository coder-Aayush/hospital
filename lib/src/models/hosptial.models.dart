// To parse this JSON data, do
//
//     final hosptial = hosptialFromJson(jsonString);

import 'dart:convert';

List<Hosptial> hosptialFromJson(String str) =>
    List<Hosptial>.from(json.decode(str).map((x) => Hosptial.fromJson(x)));

String hosptialToJson(List<Hosptial> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hosptial {
  Hosptial({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory Hosptial.fromJson(Map<String, dynamic> json) => Hosptial(
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
