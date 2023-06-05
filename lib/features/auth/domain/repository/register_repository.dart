import 'package:dartz/dartz.dart';
import '../../../../core/ error_handler/error_handler.dart';
import '../../data/request/Register_request.dart';
import '../model/register.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest);
}