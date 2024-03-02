import 'dart:convert';

class FoodResponseModel {
    final Meta meta;
    final Data data;

    FoodResponseModel({
        required this.meta,
        required this.data,
    });

    factory FoodResponseModel.fromJson(String str) => FoodResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FoodResponseModel.fromMap(Map<String, dynamic> json) => FoodResponseModel(
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
    final List<Food> data;
    final String firstPageUrl;
    final int from;
    final int lastPage;
    final String lastPageUrl;
    final List<Link> links;
    final dynamic nextPageUrl;
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
        data: List<Food>.from(json["data"].map((x) => Food.fromMap(x))),
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

class Food {
    final int id;
    final String name;
    final String description;
    final String ingredients;
    final int price;
    final double rate;
    final String types;
    final String picturePath;
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
        "created_at": createdAt,
        "updated_at": updatedAt,
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
