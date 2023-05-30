import 'package:json_annotation/json_annotation.dart';

part 'home_recommend_banner_model.g.dart';

@JsonSerializable()
class HomeRecommendBannerModel {
  String? img;

  String? title;

  String? type;

  @JsonKey(name: 'zt_id')
  String? ztId;

  HomeRecommendBannerModel(
    this.img,
    this.title,
    this.type,
    this.ztId,
  );

  factory HomeRecommendBannerModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendBannerModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendBannerModelToJson(this);
}
