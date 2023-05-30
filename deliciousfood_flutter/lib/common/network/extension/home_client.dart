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
}