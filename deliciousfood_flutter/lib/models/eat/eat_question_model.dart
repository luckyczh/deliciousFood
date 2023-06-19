import 'package:json_annotation/json_annotation.dart';

part 'eat_question_model.g.dart';

@JsonSerializable()
class EatQuestionModel {
  String? id;
  String? type;
  String? icon;
  String? title;
  String? question;
  String? btntxt;
  String? img;
  String? color;
  @JsonKey(name: "zs_img")
  String? zsImg;
  List<EatQuestionZsModel>? data;
  List<EatQuestionModel>? item;

  EatQuestionModel(
      {this.id,
      this.type,
      this.icon,
      this.title,
      this.question,
      this.btntxt,
      this.img,
      this.color,
      this.zsImg,
      this.data,
      this.item});

  factory EatQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$EatQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$EatQuestionModelToJson(this);
}

@JsonSerializable()
class EatQuestionZsModel {
  String? title;
  String? des;
  String? id;
  List<EatQuestionZsItemModel>? item;

  EatQuestionZsModel({this.title, this.des, this.id, this.item});

  factory EatQuestionZsModel.fromJson(Map<String, dynamic> json) =>
      _$EatQuestionZsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EatQuestionZsModelToJson(this);
}

@JsonSerializable()
class EatQuestionZsItemModel {
  String? txt;
  String? id;
  String? color;
  List<EatQuestionZsItemModel>? item;

  EatQuestionZsItemModel({this.txt, this.id, this.color, this.item});

  factory EatQuestionZsItemModel.fromJson(Map<String, dynamic> json) =>
      _$EatQuestionZsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$EatQuestionZsItemModelToJson(this);
}
