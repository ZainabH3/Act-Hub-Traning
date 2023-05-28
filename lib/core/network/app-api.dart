import 'package:retrofit/http.dart';

import '../../config/constants.dart';

part 'app_api.g.dart';


@RestApi(baseUrl:Constants.baseUrl )
abstract class AppApi {

}
