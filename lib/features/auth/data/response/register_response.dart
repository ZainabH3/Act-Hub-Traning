
import 'package:json_annotation/json_annotation.dart';

import '../../../../config/constants.dart';
import '../../../../core/base-response/base-response.dart';
part 'register_response.g.dart';
@JsonSerializable()
class RegisterResponse extends BaseResponse {
  @JsonKey(name: ApiConstants.status)
  bool? status;

  RegisterResponse(this.status);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson(RegisterResponse instance) =>
      _$RegisterResponseToJson(this);
}