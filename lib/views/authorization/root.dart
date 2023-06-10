import 'package:YoJob/paths.dart';
import 'package:YoJob/utils/input_validator.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/views/authorization/root_controller.dart';
import 'package:YoJob/widgets/gradient_text.dart';
import 'package:YoJob/widgets/yo_job_button.dart';
import 'package:YoJob/widgets/yo_job_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Root extends GetWidget<RootController> {
  const Root({super.key});

  RootController get c => controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingDimens.regular,
            vertical: SpacingDimens.xlarge,
          ),
          child: Obx(
            () => Form(
              key: c.formKey,
              autovalidateMode: c.autoValidateMode(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SpacingDimens.xxlargeSpacer,
                  GradientText(
                    'YouJob',
                    style: GoogleFonts.montserrat(
                      fontSize: 64.0,
                      fontWeight: FontWeight.w700,
                    ),
                    gradient: YoJobColors.yoJobThemeGradient,
                  ),
                  SpacingDimens.regularSpacer,
                  Text(
                    'Recruiting',
                    style: GoogleFonts.montserrat(
                      color: YoJobColors.primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SpacingDimens.largeSpacer,
                  Padding(
                    padding: const EdgeInsets.only(top: 29.0, bottom: 50.0),
                    child: YoJobTextField(
                      enabled: !c.isLoading,
                      validator: InputValidator.emailValidator,
                      hintText: 'E-mail',
                      controller: c.emailController,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          'lib/assets/email_icon.svg',
                        ),
                      ),
                    ),
                  ),
                  YoJobTextField(
                    validator: InputValidator.presenceValidator,
                    hintText: 'Password',
                    controller: c.passwordController,
                    obscureText: true,
                    enabled: !c.isLoading,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SvgPicture.asset('lib/assets/key_icon.svg'),
                    ),
                  ),
                  SpacingDimens.xlargeSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      YoJobButton(
                        onPressed: c.signInWithEmailPassword,
                        buttonText: 'Sign in',
                        fontSize: 24.0,
                        isLoading: c.isLoading,
                      ),
                    ],
                  ),
                  SpacingDimens.xxlargeSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: c.signInWithGoogle,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(SpacingDimens.regular),
                            child:
                                SvgPicture.asset('lib/assets/google_logo.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SpacingDimens.mediumSpacer,
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  SpacingDimens.mediumSpacer,
                  InkWell(
                    onTap: () => Get.toNamed(UnauthPaths.activation),
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.montserrat(
                        color: YoJobColors.primaryColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
