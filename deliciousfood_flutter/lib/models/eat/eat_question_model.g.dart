// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eat_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EatQuestionModel _$EatQuestionModelFromJson(Map<String, dynamic> json) =>
    EatQuestionModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      question: json['question'] as String?,
      btntxt: json['btntxt'] as String?,
      img: json['img'] as String?,
      color: json['color'] as String?,
      zsImg: json['zs_img'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EatQuestionZsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => EatQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EatQuestionModelToJson(EatQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'icon': instance.icon,
      'title': instance.title,
      'question': instance.question,
      'btntxt': instance.btntxt,
      'img': instance.img,
      'color': instance.color,
      'zs_img': instance.zsImg,
      'data': instance.data,
      'item': instance.item,
    };

EatQuestionZsModel _$EatQuestionZsModelFromJson(Map<String, dynamic> json) =>
    EatQuestionZsModel(
      title: json['title'] as String?,
      des: json['des'] as String?,
      id: json['id'] as String?,
      item: (json['item'] as List<dynamic>?)
          ?.map(
              (e) => EatQuestionZsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EatQuestionZsModelToJson(EatQuestionZsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'des': instance.des,
      'id': instance.id,
      'item': instance.item,
    };

EatQuestionZsItemModel _$EatQuestionZsItemModelFromJson(
        Map<String, dynamic> json) =>
    EatQuestionZsItemModel(
      txt: json['txt'] as String?,
      id: json['id'] as String?,
      color: json['color'] as String?,
      item: (json['item'] as List<dynamic>?)
          ?.map(
              (e) => EatQuestionZsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EatQuestionZsItemModelToJson(
        EatQuestionZsItemModel instance) =>
    <String, dynamic>{
      'txt': instance.txt,
      'id': instance.id,
      'color': instance.color,
      'item': instance.item,
    };
