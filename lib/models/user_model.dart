// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

class UserModel {
  String? username;
  String? role;
  String? parentId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  Parents? parents;

  UserModel({
    required this.username,
    required this.role,
    required this.parentId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.parents,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        role: json["role"],
        parentId: json["parentId"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        parents: Parents.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "role": role,
        // "parentId": parentId,
        // "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
        // "parent": parents!.toJson(),
      };
}

class Parents {
  Parent? mother;
  Parent? father;
  Guardian? guardian;
  String? parentCode;
  String? permanentResidence;
  String? address;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  Parents({
    required this.mother,
    required this.father,
    required this.guardian,
    required this.parentCode,
    required this.permanentResidence,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        mother: Parent.fromJson(json["mother"]),
        father: Parent.fromJson(json["father"]),
        guardian: Guardian.fromJson(json["guardian"]),
        parentCode: json["parentCode"],
        permanentResidence: json["permanentResidence"],
        address: json["address"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "mother": mother!.toJson(),
        "father": father!.toJson(),
        "guardian": guardian!.toJson(),
        "parentCode": parentCode,
        "permanentResidence": permanentResidence,
        "address": address,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "id": id,
      };
}

class Parent {
  String? name;
  DateTime? dateOfBirth;
  String? nationality;
  String? passport;
  String? occupation;
  String? email;
  String? phone;
  String? officePhone;

  Parent({
    required this.name,
    required this.dateOfBirth,
    required this.nationality,
    required this.passport,
    required this.occupation,
    required this.email,
    required this.phone,
    required this.officePhone,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        name: json["name"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationality: json["nationality"],
        passport: json["passport"],
        occupation: json["occupation"],
        email: json["email"],
        phone: json["phone"],
        officePhone: json["officePhone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dateOfBirth": dateOfBirth!.toIso8601String(),
        "nationality": nationality,
        "passport": passport,
        "occupation": occupation,
        "email": email,
        "phone": phone,
        "officePhone": officePhone,
      };
}

class Guardian {
  String? name;
  String? gender;
  String? passport;
  String? email;
  String? phone;
  String? address;
  String? relationship;

  Guardian({
    required this.name,
    required this.gender,
    required this.passport,
    required this.email,
    required this.phone,
    required this.address,
    required this.relationship,
  });

  factory Guardian.fromJson(Map<String, dynamic> json) => Guardian(
        name: json["name"],
        gender: json["gender"],
        passport: json["passport"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        relationship: json["relationship"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "passport": passport,
        "email": email,
        "phone": phone,
        "address": address,
        "relationship": relationship,
      };
}
