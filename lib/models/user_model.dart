import 'dart:convert';

class UserModel {
  String? username;
  String? role;
  String? parentId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  Parent? parent;
  UserModel({
    required this.username,
    required this.role,
    required this.parentId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.parent,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        role: json["role"],
        parentId: json["parentId"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        parent: Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "role": role,
        "parentId": parentId,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
        "parent": parent
      };
}

class Parent {
  Avatar? avatar;
  String? name;
  String? parentCode;
  String? nationality;
  String? slug;
  String? gender;
  String? address;
  DateTime? dateOfBirth;
  String? status;
  String? email;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  Parent({
    required this.avatar,
    required this.name,
    required this.parentCode,
    required this.nationality,
    required this.slug,
    required this.gender,
    required this.address,
    required this.dateOfBirth,
    required this.status,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        avatar: Avatar.fromJson(json["avatar"]),
        name: json["name"],
        parentCode: json["parentCode"],
        nationality: json["nationality"],
        slug: json["slug"],
        gender: json["gender"],
        address: json["address"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        status: json["status"],
        email: json["email"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar!.toJson(),
        "name": name,
        "parentCode": parentCode,
        "nationality": nationality,
        "slug": slug,
        "gender": gender,
        "address": address,
        "dateOfBirth": dateOfBirth!.toIso8601String(),
        "status": status,
        "email": email,
        "phone": phone,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
      };
}

class Avatar {
  String? key;
  String? bucket;
  String? url;

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
