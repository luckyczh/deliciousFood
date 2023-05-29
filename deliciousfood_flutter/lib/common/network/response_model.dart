// ignore_for_file: constant_identifier_names

/// 响应体
class ResponseModel<T> {
  var code = 0;
  var msg = "";
  T? data;

  ResponseModel(this.code, this.msg);
  ResponseModel.formJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}

/// 返回码
class ResponseCode {
  /// 请求成功
  static const NETWORK_SUCCESS = 1;

  /// 失去网络
  static const NETWORK_LOSE = -1;

  /// 请求超时
  static const NETWORK_TIMEOUT = -2;
}
