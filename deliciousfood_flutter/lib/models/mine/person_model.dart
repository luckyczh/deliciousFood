import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  @JsonKey(name: 'user_info')
  PersonInfoModel? userInfo;
  PersonNumsModel? nums;
  PersonModel(this.userInfo, this.nums);

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}

@JsonSerializable()
class PersonInfoModel {
  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'user_name')
  String? userName;

  String? avatar;

  String fensi = '0';

  String follow = '0';

  PersonInfoModel(
      this.avatar, this.fensi, this.follow, this.userId, this.userName);

  factory PersonInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PersonInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonInfoModelToJson(this);
}

@JsonSerializable()
class PersonNumsModel {
  @JsonKey(name: 'recipe_num')
  String recipeNum = '0';

  @JsonKey(name: 'work_num')
  String workNum = '0';

  @JsonKey(name: 'talk_num')
  String talkNum = '0';

  @JsonKey(name: 'article_num')
  String rarticleNum = '0';

  @JsonKey(name: 'all_num')
  String allNum = '0';

  @JsonKey(name: 'message_num')
  String messageNum = '0';

  @JsonKey(name: 'order_num')
  String orderNum = '0';

  @JsonKey(name: 'works_click_num')
  String worksClickNum = '0';

  @JsonKey(name: 'recent_num')
  String recentNum = '0';

  PersonNumsModel(
      this.allNum,
      this.messageNum,
      this.orderNum,
      this.rarticleNum,
      this.recentNum,
      this.recipeNum,
      this.talkNum,
      this.workNum,
      this.worksClickNum);

  factory PersonNumsModel.fromJson(Map<String, dynamic> json) =>
      _$PersonNumsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonNumsModelToJson(this);
}
