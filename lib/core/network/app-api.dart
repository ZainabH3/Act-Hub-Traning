
import 'package:act_hub_training/config/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app-api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppApi{
  factory AppApi(
      Dio dio, {
        String baseUrl,
      }) = _AppApi;

}



