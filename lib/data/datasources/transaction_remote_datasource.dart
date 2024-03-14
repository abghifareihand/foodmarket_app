import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodmarket_app/core/constants/variables.dart';
import 'package:foodmarket_app/data/datasources/auth_local_datasource.dart';
import 'package:foodmarket_app/data/models/transaction_response_model.dart';
import 'package:http/http.dart' as http;

class TransactionRemoteDatasource {
  Future<Either<String, TransactionResponseModel>> getTransaction() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/transaction'),
      headers: headers,
    );

    debugPrint('Response Get Transaction : ${response.body}');

    if (response.statusCode == 200) {
      return Right(TransactionResponseModel.fromJson(response.body));
    } else {
      final errorMessage = jsonDecode(response.body)['meta']['message'];
      return Left(errorMessage);
    }
  }
}
