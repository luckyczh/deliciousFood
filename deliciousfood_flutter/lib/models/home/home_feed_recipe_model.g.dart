// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFeedRecipeModel _$HomeFeedRecipeModelFromJson(Map<String, dynamic> json) =>
    HomeFeedRecipeModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      img: json['img'] as String?,
      favorAmount: json['favor_amount'] as String?,
      viewedAmount: json['viewed_amount'] as String?,
      rate: json['rate'] as String?,
      shicai:
          (json['shicai'] as List<dynamic>?)?.map((e) => e as String).toList(),
      author: json['author'] == null
          ? null
          : HomeRecommendVideoInfoAuthorModel.fromJson(
              json['author'] as Map<String, dynamic>),
      randNum: json['rand_num'] as int?,
      label: (json['label'] as List<dynamic>?)
          ?.map((e) =>
              HomeFeedRecipeLableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeFeedRecipeModelToJson(
        HomeFeedRecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'favor_amount': instance.favorAmount,
      'viewed_amount': instance.viewedAmount,
      'rate': instance.rate,
      'shicai': instance.shicai,
      'author': instance.author,
      'rand_num': instance.randNum,
      'label': instance.label,
    };

HomeFeedRecipeLableModel _$HomeFeedRecipeLableModelFromJson(
        Map<String, dynamic> json) =>
    HomeFeedRecipeLableModel(
      name: json['name'] as String?,
      desc: json['desc'] as String?,
      pic: json['pic'] as String?,
    );

Map<String, dynamic> _$HomeFeedRecipeLableModelToJson(
        HomeFeedRecipeLableModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'pic': instance.pic,
    };
