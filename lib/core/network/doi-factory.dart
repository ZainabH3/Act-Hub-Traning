import 'package:act_hub_training/core/storage/local/app-settings-shared-preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config/constants.dart';
import '../../config/dependency-injection.dart';

class DioFactory {
  final AppSettingsSharedPreferences _appSettingsPreferences =
  instance<AppSettingsSharedPreferences>();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers =
    {'authorization': 'Bearer ${_appSettingsPreferences.getToken()}',
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,

      receiveTimeout: const Duration(
          seconds: ApiConstants.receiveTimeOutDuration),
      sendTimeout: const Duration(seconds: ApiConstants.sendTimeOutDuration),
    );
    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      String token = _appSettingsPreferences.getToken();
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    });
    dio.interceptors.add(interceptorsWrapper);
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          requestHeader: true,
          request: true,

        ),
      );
    }
    return dio;
  }}
