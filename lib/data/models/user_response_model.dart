import 'dart:convert';

class UserResponseModel {
    final Meta meta;
    final Data data;

    UserResponseModel({
        required this.meta,
        required this.data,
    });

    factory UserResponseModel.fromJson(String str) => UserResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserResponseModel.fromMap(Map<String, dynamic> json) => UserResponseModel(
        meta: Meta.fromMap(json["meta"]),
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "meta": meta.toMap(),
        "data": data.toMap(),
    };
}

class Data {
    final int id;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final dynamic twoFactorConfirmedAt;
    final dynamic currentTeamId;
    final String profilePhotoPath;
    final String address;
    final String houseNumber;
    final String phoneNumber;
    final String city;
    final String roles;
    final int createdAt;
    final int updatedAt;
    final String profilePhotoUrl;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.twoFactorConfirmedAt,
        required this.currentTeamId,
        required this.profilePhotoPath,
        required this.address,
        required this.houseNumber,
        required this.phoneNumber,
        required this.city,
        required this.roles,
        required this.createdAt,
        required this.updatedAt,
        required this.profilePhotoUrl,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] ?? '',
        twoFactorConfirmedAt: json["two_factor_confirmed_at"] ?? '',
        currentTeamId: json["current_team_id"] ?? '',
        profilePhotoPath: json["profile_photo_path"] ?? '',
        address: json["address"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        roles: json["roles"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        profilePhotoUrl: json["profile_photo_url"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "address": address,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
        "city": city,
        "roles": roles,
        "created_at": createdAt,
        "updated_at": updatedAt,
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
