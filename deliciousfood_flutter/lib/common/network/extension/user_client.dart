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
}
