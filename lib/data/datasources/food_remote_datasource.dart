import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodmarket_app/core/constants/variables.dart';
import 'package:foodmarket_app/data/models/food_response_model.dart';
import 'package:http/http.dart' as http;

class FoodRemoteDatasource {
  Future<Either<String, FoodResponseModel>> getFood() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/food'),
      headers: headers,
    );

    debugPrint('Response Get Food : ${response.body}');

    if (response.statusCode == 200) {
      return Right(FoodResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, FoodResponseModel>> getFoodType(String type) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/food?types=$type'),
      headers: headers,
    );

    debugPrint('Response Get Food : ${response.body}');

    if (response.statusCode == 200) {
      return Right(FoodResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }

  Future<Either<String, FoodResponseModel>> searchFood(String name) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/food?name=$name'),
      headers: headers,
    );

    debugPrint('Response Get Food : ${response.body}');

    if (response.statusCode == 200) {
      return Right(FoodResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }
}
