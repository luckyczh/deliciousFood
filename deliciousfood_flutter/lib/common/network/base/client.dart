import 'dart:convert';
import 'package:deliciousfood_flutter/common/network/base/response_model.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'interceptors.dart';

final Client client = Client.manager;

class Client {
  static Client manager = Client._();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Api.baseUrl,
        headers: {
          "User-Agent":
              "model:phone;Version:meishij8.2.5;udid:485f21f799a5699cb75bb3b182c8b5d3;free:1;sInch:{828, 1792};sversion:16.4.1;channel:appstore;idfa:"
        },
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        contentType: "application/json"),
  );

  Client._() {
    // (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.findProxy = (url) {
    //     return "PROXY 10.98.7.25:8888";
    //   };
    // };
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(LogsInterceptors());
  }

  Future<dynamic> fetch(String url,
      {String method = "GET", Map<String, dynamic>? parameter}) async {
    Response<dynamic>? result;
    try {
      if (method == "GET") {
        result = await _dio.get(url, queryParameters: parameter);
      } else {
        result = await _dio.post(url, data: parameter);
      }

      Map<String, dynamic> data = {};
      if (result.data is String) {
        try {
          data = jsonDecode(result.data);
        } catch (e) {
          return null;
        }
      } else {
        data = result.data;
      }
      final res = ResponseModel.formJson(data);
      if (res.code != '1' && res.code != '11') {
        Fluttertoast.showToast(msg: res.msg);
      } else {
        return res.data;
      }
    } on DioException catch (e) {
      if (e.response?.data is ResponseModel) {
        final res = e.response?.data as ResponseModel;
        Fluttertoast.showToast(msg: res.msg);
        return res.data;
      } else {
        Fluttertoast.showToast(msg: e.error.toString());
        return null;
      }
    }
  }

  Future<List<T>> fetchList<T>(String url,
      {String method = "GET",
      Map<String, dynamic>? parameter,
      DataTransform<T>? transform}) async {
    final result = await fetch(url, method: method, parameter: parameter);
    if (result == null) {
      return [];
    }
    if (transform == null) {
      return result;
    }
    return transform(result);
  }
}

typedef DataTransform<T> = List<T> Function(dynamic);
