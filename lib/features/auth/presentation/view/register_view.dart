import 'package:act_hub_training/features/auth/presentation/view/widget/auth_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ controller/regsiter_controller.dart';
import '../../../../core/resources/manager-colors.dart';
import '../../../../core/resources/manager_font.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/main-button.dart';
import '../../../../routes/routes.dart';

class RegisterView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return authView(
      isRegisterView: true,
      child: GetBuilder<RegisterController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    ManagerStrings.signUp,
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s24,
                      color: ManagerColors.black,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h30),
                  baseTextFormField(
                    controller: controller.fullName,
                    hintText: ManagerStrings.fullName,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _failedValidator.validateFullName(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.email,
                    hintText: ManagerStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _failedValidator.validateEmail(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.phone,
                    hintText: ManagerStrings.phone,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _failedValidator.validatePhone(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.password,
                    hintText: ManagerStrings.password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) => _failedValidator.validatePassword(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.confirmPassword,
                    hintText: ManagerStrings.confirmPassword,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) => _failedValidator.validatePassword(
                      value,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: ManagerColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r4)),
                      ),
                      Text(
                        ManagerStrings.agreePolicy,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s10,
                          color: ManagerColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ManagerHeight.h40),
                  mainButton(
                      child: Text(
                        ManagerStrings.signUp,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.white,
                        ),
                      ),
                      minWidth: double.infinity,
                      color: ManagerColors.primaryColor,
                      height: ManagerHeight.h40,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.register(context);
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ManagerStrings.haveAccount,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
                      ),
                      mainButton(
                          child: Text(
                            ManagerStrings.login,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Get.offAllNamed(Routes.loginView);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
