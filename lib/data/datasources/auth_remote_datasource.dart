import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodmarket_app/core/constants/variables.dart';
import 'package:foodmarket_app/data/datasources/auth_local_datasource.dart';
import 'package:foodmarket_app/data/models/auth_response_model.dart';
import 'package:foodmarket_app/data/models/request/login_request_model.dart';
import 'package:foodmarket_app/data/models/request/register_request_model.dart';
import 'package:foodmarket_app/data/models/request/user_request_model.dart';
import 'package:foodmarket_app/data/models/user_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequest) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: headers,
      body: registerRequest.toJson(),
    );

    debugPrint('Request Register : ${registerRequest.toJson()}');
    debugPrint('Response Register : ${response.body}');

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel loginRequest) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: loginRequest.toJson(),
    );

    debugPrint('Request Login : ${loginRequest.toJson()}');
    debugPrint('Response Login : ${response.body}');

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, String>> logout() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );

    debugPrint('Response Logout : ${response.body}');

    if (response.statusCode == 200) {
      final successMessage = jsonDecode(response.body)['meta']['message'];
      return Right(successMessage);
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, UserResponseModel>> getUser() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/user'),
      headers: headers,
    );

    debugPrint('Response Get User : ${response.body}');

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, UserResponseModel>> updateUser(UserRequestModel userRequest) async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/user'),
      headers: headers,
      body: userRequest.toJson(),
    );

    debugPrint('Response Update User : ${response.body}');

    if (response.statusCode == 200) {
      return Right(UserResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }
}
