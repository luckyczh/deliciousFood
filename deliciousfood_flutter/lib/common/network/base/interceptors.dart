import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deliciousfood_flutter/common/Config.dart';
import 'package:deliciousfood_flutter/common/network/base/response_model.dart';
import 'package:deliciousfood_flutter/common/utils/utils.dart' as Fluttertoast;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogsInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          response: Response(
              requestOptions: options,
              data: ResponseModel(
                  ResponseCode.NETWORK_LOSE, Config.noNetworkMsg))));
    }
    String token = await SharedPreferencesAsync().getString("token") ?? "";
    Map<String, dynamic> parametres = {"format": "json", "token": token};
    parametres.addAll(options.queryParameters);
    options.queryParameters = parametres;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Fluttertoast.showToast(err.message ?? "");
    super.onError(err, handler);
  }
}
