import 'package:deliciousfood_flutter/common/network/base/api.dart';
import 'package:deliciousfood_flutter/common/network/base/client.dart';
import 'package:deliciousfood_flutter/models/home/home_feed_model.dart';
import 'package:deliciousfood_flutter/models/mine/person_model.dart';

extension UserClient on Client {
  /// 用户信息
  Future<PersonModel> getUerInfo() async {
    final result = await fetch(Api.personInfo);
    if (result == null) {
      return PersonModel(null, null);
    }
    return PersonModel.fromJson(result);
  }

  /// 收藏列表
  Future<List<HomeFeedModel>> getFavList(int pageIndex) async {
    final result = await fetchList(
      Api.personFavoriteList,
      parameter: {"page": pageIndex, "per_page": 10},
      transform: (result) {
        return (result["items"] as List)
            .map((e) => HomeFeedModel.fromJson(e))
            .toList();
      },
    );
    return result;
  }

  /// 浏览列表
  Future<List<HomeFeedModel>> getRecentList(int pageIndex) async {
    final result = await fetchList(
      Api.personRecentList,
      parameter: {"page": pageIndex, "per_page": 10},
      transform: (result) {
        var list = result["items"];
        if (list == null) {
          return List<HomeFeedModel>.empty();
        }
        return (list as List).map((e) => HomeFeedModel.fromJson(e)).toList();
      },
    );
    return result;
  }

  /// 删除浏览历史
  Future<void> deleteRecent() async {
    return fetch(Api.deleteRecent);
  }

  /// 发送验证码
  Future<void> sendMsg(String moblie) async {
    return fetch(Api.sendMsg, parameter: {
      "type": "6",
      "mobile": moblie,
      "vk": "1f9462481164aa2f2cead20c4897f815"
    });
  }

  /// 验证码登录
  Future<dynamic> codeLogin(String moblie, String code) async {
    return fetch(Api.codeLogin,
        parameter: {"phone": moblie, "security_code": code});
  }
}
