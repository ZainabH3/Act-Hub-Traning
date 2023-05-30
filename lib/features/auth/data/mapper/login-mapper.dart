import 'package:act_hub_training/core/extensions/extensions.dart';

import '../domain/model/login-model.dart';
import '../response/login-response.dart';

extension LoginMapper on LoginResponse{
  toDomain() {
    return Login(token: token.onNull());
  }
}

