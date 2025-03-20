// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      json['access_token'] as String,
      json['expires_in'] as String,
      json['is_agree'] as num,
      json['refresh_token'] as String,
      json['user_id'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'is_agree': instance.isAgree,
      'refresh_token': instance.refreshToken,
      'user_id': instance.userId,
    };
