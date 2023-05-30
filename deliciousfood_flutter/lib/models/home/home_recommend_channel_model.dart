import 'package:json_annotation/json_annotation.dart';

part 'home_recommend_channel_model.g.dart';

@JsonSerializable()
class HomeRecommendChannelModel {
  String? img;

  String? jump;

  String? title;

  String? type;

  HomeRecommendChannelModel(
    this.img,
    this.jump,
    this.title,
    this.type,
  );

  factory HomeRecommendChannelModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeRecommendChannelModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecommendChannelModelToJson(this);
}
