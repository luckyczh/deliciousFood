import 'package:deliciousfood_flutter/models/home/home_recommend_video_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_feed_caidan_model.g.dart';

@JsonSerializable()
class HomeFeedCaidanModel {
  String? id;
  @JsonKey(name: "total_amount")
  String? totalAmount;
  String? title;
  String? desc;
  HomeRecommendVideoInfoAuthorModel? author;
  List<String>? img;
  @JsonKey(name: "rand_num")
  int? randNum;

  HomeFeedCaidanModel({
    this.id,
    this.totalAmount,
    this.title,
    this.desc,
    this.author,
    this.img,
    this.randNum,
  });

  factory HomeFeedCaidanModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedCaidanModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeFeedCaidanModelToJson(this);
}
