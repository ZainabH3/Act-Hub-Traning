import 'package:act_hub_training/config/constants.dart';
import 'package:act_hub_training/core/resources/manager_styles.dart';
import 'package:act_hub_training/core/widgets/scaffold-with-background-image.dart';
import 'package:act_hub_training/features/auth/presentation/view/widget/auth_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../ controller/login-controller.dart';
import '../../../../core/resources/manager-assets.dart';
import '../../../../core/resources/manager-colors.dart';
import '../../../../core/resources/manager_font.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/custom_check_box.dart';
import '../../../../core/widgets/main-button.dart';
import '../../../../routes/routes.dart';


class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  @override
  Widget build(BuildContext context) {
    return authView(
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  ManagerStrings.login,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s24,
                    color: ManagerColors.black,
                  ),
                ),
                SizedBox(height: ManagerHeight.h30),
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
                  controller: controller.password,
                  hintText: ManagerStrings.password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) => _failedValidator.validatePassword(
                    value,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        customCheckbox(
                          state: controller.rememberMe,
                          onChanged: (status) {
                            controller.changeRememberMe(status!);
                          },
                        ),
                        Text(
                          ManagerStrings.rememberMe,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                      ],
                    ),
                    mainButton(
                      child: Text(
                        ManagerStrings.forgotPassword,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h90),
                mainButton(
                    child: Text(
                      ManagerStrings.login,
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
                        controller.performLogin(context);
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.haveNotAccount,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.black),
                    ),
                    mainButton(
                        child: Text(
                          ManagerStrings.signUp,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          Get.offAllNamed(Routes.registerView);
                        }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
