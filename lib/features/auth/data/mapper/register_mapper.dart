
import 'package:act_hub_training/core/extensions/extensions.dart';

import '../../domain/model/register.dart';
import '../response/register_response.dart';

extension RegisterMapper on RegisterResponse {
  toDomain() {
    return Register(status: status.onNull());
  }
}