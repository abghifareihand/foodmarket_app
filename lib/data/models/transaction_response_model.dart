import 'dart:convert';

class TransactionResponseModel {
  final Meta meta;
  final Data data;

  TransactionResponseModel({
    required this.meta,
    required this.data,
  });

  factory TransactionResponseModel.fromJson(String str) =>
      TransactionResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionResponseModel.fromMap(Map<String, dynamic> json) =>
      TransactionResponseModel(
        meta: Meta.fromMap(json["meta"]),
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "meta": meta.toMap(),
        "data": data.toMap(),
      };
}

class Data {
  final int currentPage;
  final List<Datum> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"] ?? '',
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"] ?? '',
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  final int id;
  final int userId;
  final int foodId;
  final String transactionNumber;
  final int quantity;
  final int total;
  final String status;
  final String paymentUrl;
  final int deletedAt;
  final String createdAt;
  final String updatedAt;
  final Food food;
  final User user;

  Datum({
    required this.id,
    required this.userId,
    required this.foodId,
    required this.transactionNumber,
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

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        foodId: json["food_id"],
        transactionNumber: json["transaction_number"],
        quantity: json["quantity"],
        total: json["total"],
        status: json["status"],
        paymentUrl: json["payment_url"],
        deletedAt: json["deleted_at"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        food: Food.fromMap(json["food"]),
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "food_id": foodId,
        "transaction_number": transactionNumber,
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
  final int deletedAt;
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
  final String emailVerifiedAt;
  final String twoFactorConfirmedAt;
  final String currentTeamId;
  final String profilePhotoPath;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String roles;
  final int createdAt;
  final int updatedAt;
  final String profilePhotoUrl;

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
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
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

class Link {
  final String url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"] ?? '',
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
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
