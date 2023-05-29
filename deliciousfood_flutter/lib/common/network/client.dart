import 'dart:convert';

import 'package:deliciousfood_flutter/common/network/api.dart';
import 'package:deliciousfood_flutter/common/network/interceptors.dart';
import 'package:deliciousfood_flutter/common/network/response_model.dart';
import 'package:dio/dio.dart';

Client client = Client.manager;

class Client {
  static Client manager = Client._();
  final Dio _dio = Dio(BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      contentType: "application/json"));

  Client._() {
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(LogsInterceptors());
  }

  Future<ResponseModel<Map<String, dynamic>>> fetch(String url,
      [String method = "GET", Map<String, dynamic>? parameter]) async {
    Response<dynamic>? result;
    if (method == "GET") {
      result = await _dio.get(url, queryParameters: parameter);
    } else {
      result = await _dio.post(url, data: parameter);
    }
    Map<String, dynamic> data = {};
    if (result.data is String) {
      data = json.decode(result.data);
    } else {
      data = result.data;
    }
    return ResponseModel.formJson(data);
  }
}
// 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
//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