import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../config/dependency-injection.dart';
import '../../domain/use-case/login-use-case.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(email: email.text, password: password.text),
    )).fold((l) {
      print('failed');
    }, (r) {
      print('success');
    });
  }
}