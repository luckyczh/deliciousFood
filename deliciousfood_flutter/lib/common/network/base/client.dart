import 'dart:convert';
import 'package:deliciousfood_flutter/common/network/base/response_model.dart';
import 'package:deliciousfood_flutter/common/utils/extension.dart';
import 'package:deliciousfood_flutter/providers/login_state_provider.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
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
              "model:phone;Version:meishij8.2.8;udid:234708f5c5166fed2bcf3e60c3e9652d;free:1;sInch:{750, 1624};sversion:16.7;channel:appstore;idfa:"
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
          Fluttertoast.showToast(msg: e.toString());
          return Future.error(e);
        }
      } else {
        data = result.data;
      }
      final res = ResponseModel.formJson(data);
      if (res.code == '101') {
        Provider.of<LoginStateProvider>(GlobalContextX.rootContext).logout();
        return Future.error(res);
      } else if (res.code != '1' && res.code != '11') {
        Fluttertoast.showToast(msg: res.msg);
        return Future.error(res);
      } else {
        return res.data;
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
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
