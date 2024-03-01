import 'dart:convert';

class UserRequestModel {
  final String name;
  final String email;
  final String address;
  final String city;
  final String houseNumber;
  final String phoneNumber;

  UserRequestModel({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.houseNumber,
    required this.phoneNumber,
  });

  factory UserRequestModel.fromJson(String str) =>
      UserRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserRequestModel.fromMap(Map<String, dynamic> json) =>
      UserRequestModel(
        name: json["name"],
        email: json["email"],
        address: json["address"],
        city: json["city"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "address": address,
        "city": city,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
      };
}
