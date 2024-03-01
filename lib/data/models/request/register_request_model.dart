import 'dart:convert';

class RegisterRequestModel {
    final String name;
    final String email;
    final String password;
    final String passwordConfirmation;
    final String address;
    final String city;
    final String houseNumber;
    final String phoneNumber;

    RegisterRequestModel({
        required this.name,
        required this.email,
        required this.password,
        required this.passwordConfirmation,
        required this.address,
        required this.city,
        required this.houseNumber,
        required this.phoneNumber,
    });

    factory RegisterRequestModel.fromJson(String str) => RegisterRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterRequestModel.fromMap(Map<String, dynamic> json) => RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        address: json["address"],
        city: json["city"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "address": address,
        "city": city,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
    };
}
