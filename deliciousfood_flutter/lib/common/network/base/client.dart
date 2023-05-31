import 'dart:convert';

import 'package:deliciousfood_flutter/common/network/base/response_model.dart';
import 'package:dio/dio.dart';

import 'api.dart';
import 'interceptors.dart';

final Client client = Client.manager;

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

  Future<dynamic> fetch(String url,
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
    return ResponseModel.formJson(data).data;
  }
}

// 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