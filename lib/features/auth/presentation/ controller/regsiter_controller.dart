import 'package:act_hub_training/core/storage/local/app-settings-shared-preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import '../../../../config/dependency-injection.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/widgets/dialog_button.dart';
import '../../domain/use-case/register_use_case.dart';



class RegisterController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController fullName = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();
  final RegisterUseCase _registerUseCase = instance<RegisterUseCase>();

  Future<void> register(BuildContext context) async {
    dialogRender(
      context: context,
      stateRenderType: StateRenderType.popUpLoadingState,
      message: ManagerStrings.loading,
      title: '',
    );
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        name: fullName.text,
        email: email.text,
        password: password.text,
        confirmationPassword: confirmPassword.text,
        phone: phone.text,
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.message,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: dialogButton(
              message: ManagerStrings.ok,
              onPressed: () {
                Get.back();
              }),
        ),
      );
    }, (r) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpSuccessState,
        message: ManagerStrings.thanks,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: dialogButton(
            onPressed: () {
              Get.back();
              // Get.offAllNamed(Routes.homeView);
            },
            message: ManagerStrings.thanks,
          ),
        ),
      );
    });
  }
}