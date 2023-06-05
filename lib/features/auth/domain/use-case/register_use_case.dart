

import 'package:dartz/dartz.dart';

import '../../../../core/ error_handler/error_handler.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/request/Register_request.dart';
import '../model/register.dart';
import '../repository/register_repository.dart';

class RegisterUseCaseInput {
  String? name;
  String? email;
  String? password;
  String? confirmationPassword;
  String? phone;

  RegisterUseCaseInput({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmationPassword,
    required this.phone,
  });
}

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, Register> {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  @override
  Future<Either<Failure, Register>> execute(RegisterUseCaseInput input) async {
    return await _registerRepository.register(RegisterRequest(
      name: input.name,
      email: input.email,
      password: input.password,
      confirmationPassword: input.confirmationPassword,
      phone: input.phone,
    ));
  }
}
