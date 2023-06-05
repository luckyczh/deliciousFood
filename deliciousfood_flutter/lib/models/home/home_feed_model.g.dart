// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFeedModel _$HomeFeedModelFromJson(Map<String, dynamic> json) =>
    HomeFeedModel(
      type: json['type'] as String?,
      tag: json['tag'] as String?,
      whRatio: json['wh_ratio'],
      recipe: json['recipe'] == null
          ? null
          : HomeFeedRecipeModel.fromJson(
              json['recipe'] as Map<String, dynamic>),
      hotSearch: (json['hot_search'] as List<dynamic>?)
          ?.map((e) =>
              HomeFeedRecipeLableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      caidan: json['caidan'] == null
          ? null
          : HomeFeedCaidanModel.fromJson(
              json['caidan'] as Map<String, dynamic>),
      videoRecipe: json['video_recipe'] == null
          ? null
          : HomeFeedRecipeModel.fromJson(
              json['video_recipe'] as Map<String, dynamic>),
      sceneClass: json['scene_class'] == null
          ? null
          : HomeFeedSceneClassModel.fromJson(
              json['scene_class'] as Map<String, dynamic>),
      article: json['article'] == null
          ? null
          : HomeFeedArticleModel.fromJson(
              json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeFeedModelToJson(HomeFeedModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tag': instance.tag,
      'wh_ratio': instance.whRatio,
      'recipe': instance.recipe,
      'hot_search': instance.hotSearch,
      'caidan': instance.caidan,
      'video_recipe': instance.videoRecipe,
      'scene_class': instance.sceneClass,
      'article': instance.article,
    };
