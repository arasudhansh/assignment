// To parse this JSON data, do
//
//     final homepageModel = homepageModelFromJson(jsonString);

import 'dart:convert';

List<HomepageModel> homepageModelFromJson(String str) => List<HomepageModel>.from(json.decode(str).map((x) => HomepageModel.fromJson(x)));

String homepageModelToJson(List<HomepageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomepageModel {
    HomepageModel({
        required this.title,
        this.subPaths,
        required this.id,
        required this.abcd,
        required this.phone,
        required this.countryCode,
    });

    String title;
    dynamic subPaths;
    String id;
    String abcd;
    String phone;
    String countryCode;

    factory HomepageModel.fromJson(Map<String, dynamic> json) => HomepageModel(
        title: json["title"],
        subPaths: json["sub_paths"],
        id: json["id"],
        abcd: json["abcd"] == null ? null : json["abcd"],
        phone: json["phone"] == null ? null : json["phone"],
        countryCode: json["countryCode"] == null ? null : json["countryCode"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "sub_paths": subPaths,
        "id": id,
        "abcd": abcd == null ? null : abcd,
        "phone": phone == null ? null : phone,
        "countryCode": countryCode == null ? null : countryCode,
    };
}

class SubPath {
    SubPath({
        required this.id,
        required this.title,
        required this.image,
    });

    String id;
    String title;
    String image;

    factory SubPath.fromJson(Map<String, dynamic> json) => SubPath(
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}
