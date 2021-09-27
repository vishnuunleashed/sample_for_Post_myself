// To parse this JSON data, do
//
//     final postSample = postSampleFromJson(jsonString);

import 'dart:convert';

PostSample postSampleFromJson(String str) => PostSample.fromJson(json.decode(str));

String postSampleToJson(PostSample data) => json.encode(data.toJson());

class PostSample {
  PostSample({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory PostSample.fromJson(Map<String, dynamic> json) => PostSample(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
