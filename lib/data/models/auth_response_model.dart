import 'dart:convert';

class AuthResponseModel {
  final Meta meta;
  final Data data;

  AuthResponseModel({
    required this.meta,
    required this.data,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        meta: Meta.fromMap(json["meta"]),
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "meta": meta.toMap(),
        "data": data.toMap(),
      };
}

class Data {
  final String accessToken;
  final String tokenType;
  final User user;

  Data({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toMap(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String roles;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final int createdAt;
  final int updatedAt;
  final dynamic profilePhotoPath;
  final String profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.address,
    required this.houseNumber,
    required this.phoneNumber,
    required this.city,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoPath,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
        address: json["address"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        profilePhotoPath: json["profile_photo_path"] ?? '',
        profilePhotoUrl: json["profile_photo_url"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
        "address": address,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
        "city": city,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "profile_photo_path": profilePhotoPath,
        "profile_photo_url": profilePhotoUrl,
      };
}

class Meta {
  final int code;
  final String status;
  final String message;

  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
