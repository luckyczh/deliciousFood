import 'package:deliciousfood_flutter/models/home/home_feed_model.dart';

import '../../../models/home/home_recommend_model.dart';
import '../base/api.dart';
import '../base/client.dart';

extension HomeClient on Client {
  /// 获取首页推荐数据
  Future<List<HomeRecommendModel>> getHomeRecommendData() async {
    var result = ((await fetch(Api.homeRecommend)) as List)
        .map((e) => HomeRecommendModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return result;
  }

  /// 获取首页feed数据
  Future<List<HomeFeedModel>> getHomeFeedData({int page = 1}) async {
    final result = await fetch(Api.homeFeed, parameter: {"page": page})
        as Map<String, dynamic>;
    final list = (result["items"] as List)
        .map((e) => HomeFeedModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }
}
