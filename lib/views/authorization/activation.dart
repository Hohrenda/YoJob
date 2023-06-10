import 'package:YoJob/utils/input_validator.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/views/authorization/activation_controller.dart';
import 'package:YoJob/widgets/gradient_text.dart';
import 'package:YoJob/widgets/yo_job_button.dart';
import 'package:YoJob/widgets/yo_job_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Activation extends GetWidget<ActivationController> {
  const Activation({super.key});

  ActivationController get c => controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: Get.back,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingDimens.regular,
              vertical: SpacingDimens.xlarge,
            ),
            child: Form(
              key: c.formKey,
              autovalidateMode: c.autoValidateMode(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
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
                        onPressed: c.signUpWithEmailAndPassword,
                        buttonText: 'Sign up',
                        fontSize: 24.0,
                        isLoading: c.isLoading,
                      ),
                    ],
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
