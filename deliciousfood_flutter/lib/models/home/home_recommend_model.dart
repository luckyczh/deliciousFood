import 'package:deliciousfood_flutter/models/home/home_recommend_sancan_model.dart';
import 'package:deliciousfood_flutter/models/home/home_recommend_video_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'home_recommend_channel_model.dart';
import 'home_recommend_jieqisc_model.dart';
import 'home_recommend_zhuanti_model.dart';

part 'home_recommend_model.g.dart';

@JsonSerializable()
class HomeRecommendModel {
  List<HomeRecommendChannelModel>? channel;

  @JsonKey(name: "jieqi_sc")
  HomeRecommendJieqiscModel? jieqiSc;

  @JsonKey(name: "recommend_info")
  HomeRecommendInfoModel? recommendInfo;

  List<HomeRecommendModel>? sancan;

  List<HomeRecommendSancanModel>? items;

  final String title;

  final String type;

  @JsonKey(name: "video_info")
  List<HomeRecommendVideoInfoModel>? videoInfo;

  List<HomeRecommendZhuantiModel>? zhuanti;

  HomeRecommendModel(
    this.channel,
    this.jieqiSc,
    this.recommendInfo,
    this.sancan,
    this.title,
    this.type,
    this.videoInfo,
    this.zhuanti,
  );

  factory HomeRecommendModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendModelToJson(this);
}

@JsonSerializable()
class HomeRecommendInfoModel {
  @JsonKey(name: "recommend_text")
  final String recommendText;

  HomeRecommendInfoModel(
    this.recommendText,
  );

  factory HomeRecommendInfoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendInfoModelToJson(this);
}
