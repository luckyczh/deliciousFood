import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deliciousfood_flutter/common/Config.dart';
import 'package:deliciousfood_flutter/common/network/base/response_model.dart';
import 'package:dio/dio.dart';

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
    options.queryParameters["format"] = "json";
    options.queryParameters["token"] = "beeb08d1ea97e11105ec47f20efdf8c9";
    super.onRequest(options, handler);
  }
}
