import 'package:json_annotation/json_annotation.dart';

part 'home_feed_sceneclass_model.g.dart';

@JsonSerializable()
class HomeFeedSceneClassModel {
  String? type;
  String? id;
  String? icon;
  String? title;
  String? question;
  String? btntxt;
  String? img;
  String? color;

  HomeFeedSceneClassModel({
    this.type,
    this.id,
    this.icon,
    this.title,
    this.question,
    this.btntxt,
    this.img,
    this.color,
  });

  factory HomeFeedSceneClassModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFeedSceneClassModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeFeedSceneClassModelToJson(this);
}
