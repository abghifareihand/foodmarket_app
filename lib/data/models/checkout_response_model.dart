import 'dart:convert';

class CheckoutResponseModel {
    final Meta meta;
    final Data data;

    CheckoutResponseModel({
        required this.meta,
        required this.data,
    });

    factory CheckoutResponseModel.fromJson(String str) => CheckoutResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CheckoutResponseModel.fromMap(Map<String, dynamic> json) => CheckoutResponseModel(
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
    final int userId;
    final int foodId;
    final int quantity;
    final int total;
    final String status;
    final String paymentUrl;
    final int deletedAt;
    final int createdAt;
    final int updatedAt;
    final Food food;
    final User user;

    Data({
        required this.id,
        required this.userId,
        required this.foodId,
        required this.quantity,
        required this.total,
        required this.status,
        required this.paymentUrl,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.food,
        required this.user,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        foodId: json["food_id"],
        quantity: json["quantity"],
        total: json["total"],
        status: json["status"],
        paymentUrl: json["payment_url"],
        deletedAt: json["deleted_at"] ?? 0,
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        food: Food.fromMap(json["food"]),
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "food_id": foodId,
        "quantity": quantity,
        "total": total,
        "status": status,
        "payment_url": paymentUrl,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "food": food.toMap(),
        "user": user.toMap(),
    };
}

class Food {
    final int id;
    final String name;
    final String description;
    final String ingredients;
    final int price;
    final double rate;
    final String types;
    final String picturePath;
    final dynamic deletedAt;
    final int createdAt;
    final int updatedAt;

    Food({
        required this.id,
        required this.name,
        required this.description,
        required this.ingredients,
        required this.price,
        required this.rate,
        required this.types,
        required this.picturePath,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Food.fromJson(String str) => Food.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Food.fromMap(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        ingredients: json["ingredients"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        types: json["types"],
        picturePath: json["picturePath"],
        deletedAt: json["deleted_at"] ?? 0,
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "ingredients": ingredients,
        "price": price,
        "rate": rate,
        "types": types,
        "picturePath": picturePath,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class User {
    final int id;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final dynamic twoFactorConfirmedAt;
    final dynamic currentTeamId;
    final dynamic profilePhotoPath;
    final String address;
    final String houseNumber;
    final String phoneNumber;
    final String city;
    final String roles;

    User({
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
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
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
