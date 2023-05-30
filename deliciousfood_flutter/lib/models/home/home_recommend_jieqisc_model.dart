import 'package:json_annotation/json_annotation.dart';

import 'home_recommend_banner_model.dart';

part 'home_recommend_jieqisc_model.g.dart';

@JsonSerializable()
class HomeRecommendJieqiscModel {
  @JsonKey(name: 'banner')
  HomeRecommendBannerModel? banner;

  @JsonKey(name: 'corner_img')
  String? cornerImg;

  @JsonKey(name: 'jq_text')
  String? jqText;

  @JsonKey(name: 'jq_time')
  String? jqTime;

  @JsonKey(name: 'jq_tips')
  List<String>? jqTips;

  @JsonKey(name: 'jq_title')
  String? jqTitle;

  @JsonKey(name: 'sc_list')
  List<String>? scList;

  @JsonKey(name: 'zt_id')
  String? ztId;

  HomeRecommendJieqiscModel(
    this.banner,
    this.cornerImg,
    this.jqText,
    this.jqTime,
    this.jqTips,
    this.jqTitle,
    this.scList,
    this.ztId,
  );

  factory HomeRecommendJieqiscModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendJieqiscModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendJieqiscModelToJson(this);
}
