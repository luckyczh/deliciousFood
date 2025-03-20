// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      json['user_info'] == null
          ? null
          : PersonInfoModel.fromJson(json['user_info'] as Map<String, dynamic>),
      json['nums'] == null
          ? null
          : PersonNumsModel.fromJson(json['nums'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'user_info': instance.userInfo,
      'nums': instance.nums,
    };

PersonInfoModel _$PersonInfoModelFromJson(Map<String, dynamic> json) =>
    PersonInfoModel(
      json['avatar'] as String?,
      json['fensi'] as int,
      json['follow'] as String,
      json['user_id'] as String?,
      json['user_name'] as String?,
      json['if_v'] as int,
    );

Map<String, dynamic> _$PersonInfoModelToJson(PersonInfoModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'avatar': instance.avatar,
      'fensi': instance.fensi,
      'follow': instance.follow,
      'if_v': instance.ifV,
    };

PersonNumsModel _$PersonNumsModelFromJson(Map<String, dynamic> json) =>
    PersonNumsModel(
      json['all_num'] as int,
      json['message_num'] as String,
      json['order_num'] as String,
      json['article_num'] as String,
      json['recent_num'] as String,
      json['recipe_num'] as String,
      json['talk_num'] as String,
      json['work_num'] as String,
      json['works_click_num'] as int,
    );

Map<String, dynamic> _$PersonNumsModelToJson(PersonNumsModel instance) =>
    <String, dynamic>{
      'recipe_num': instance.recipeNum,
      'work_num': instance.workNum,
      'talk_num': instance.talkNum,
      'article_num': instance.rarticleNum,
      'all_num': instance.allNum,
      'message_num': instance.messageNum,
      'order_num': instance.orderNum,
      'works_click_num': instance.worksClickNum,
      'recent_num': instance.recentNum,
    };
