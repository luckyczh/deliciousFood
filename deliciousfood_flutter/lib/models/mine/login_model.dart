import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: 'access_token')
  String accessToken = "";

  @JsonKey(name: 'expires_in')
  String expiresIn = "";

  @JsonKey(name: 'is_agree')
  num isAgree = 0;

  @JsonKey(name: 'refresh_token')
  String refreshToken = "";

  @JsonKey(name: 'user_id')
  String userId = "";

  LoginModel(
    this.accessToken,
    this.expiresIn,
    this.isAgree,
    this.refreshToken,
    this.userId,
  );

  factory LoginModel.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
