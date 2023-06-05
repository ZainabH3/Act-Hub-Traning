

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../config/constants.dart';
import '../../config/request-constants.dart';
import '../../features/auth/data/response/login-response.dart';
import '../../features/auth/data/response/register_response.dart';
part 'app-api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi{
  factory AppApi(
      Dio dio, {
        String baseUrl,
      }) = _AppApi;


  @POST(RequestConstants.login)
  Future<LoginResponse> login(
      @Field(ApiConstants.email) email, @Field(ApiConstants.password) password);

  @POST(RequestConstants.register)
  Future<RegisterResponse> register(
      @Field(ApiConstants.name) name,
      @Field(ApiConstants.email) email,
      @Field(ApiConstants.password) password,
      @Field(ApiConstants.passwordConfirmation) passwordConfirmation,
      @Field(ApiConstants.phone) phone,
      );
}



