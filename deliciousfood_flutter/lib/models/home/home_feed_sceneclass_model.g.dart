// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_sceneclass_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFeedSceneClassModel _$HomeFeedSceneClassModelFromJson(
        Map<String, dynamic> json) =>
    HomeFeedSceneClassModel(
      type: json['type'] as String?,
      id: json['id'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      question: json['question'] as String?,
      btntxt: json['btntxt'] as String?,
      img: json['img'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$HomeFeedSceneClassModelToJson(
        HomeFeedSceneClassModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'icon': instance.icon,
      'title': instance.title,
      'question': instance.question,
      'btntxt': instance.btntxt,
      'img': instance.img,
      'color': instance.color,
    };
