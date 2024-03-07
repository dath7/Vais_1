// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? name;
  String? username;
  String? password;
  String? gender;
  ContactInfo? contactInfo;
  List<String>? roles;
  Avatar? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  UserModel({
    required this.name,
    required this.username,
    required this.password,
    required this.gender,
    required this.contactInfo,
    required this.roles,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        username: json["username"],
        password: json["password"],
        gender: json["gender"],
        contactInfo: ContactInfo.fromJson(json["contactInfo"]),
        roles: List<String>.from(json["roles"].map((x) => x)),
        avatar: Avatar.fromJson(json["avatar"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "password": password,
        "gender": gender,
        "contactInfo": contactInfo!.toJson(),
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "avatar": avatar!.toJson(),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
      };
}

class Avatar {
  String key;
  String bucket;
  String url;

  Avatar({
    required this.key,
    required this.bucket,
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        key: json["key"],
        bucket: json["bucket"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "bucket": bucket,
        "url": url,
      };
}

class ContactInfo {
  String email;
  List<String> phones;
  List<String> address;

  ContactInfo({
    required this.email,
    required this.phones,
    required this.address,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        email: json["email"],
        phones: List<String>.from(json["phones"].map((x) => x)),
        address: List<String>.from(json["address"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phones": List<dynamic>.from(phones.map((x) => x)),
        "address": List<dynamic>.from(address.map((x) => x)),
      };
}
