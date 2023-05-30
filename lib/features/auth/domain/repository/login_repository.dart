import 'package:dartz/dartz.dart';

import '../../../../../core/ error_handler/error_handler.dart';
import '../../data/request/login-request.dart';

import '../model/login-model.dart';

abstract class LoginRepository{
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}
