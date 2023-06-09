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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingDimens.regular,
            vertical: SpacingDimens.xlarge,
          ),
          child: Form(
            key: c.formKey,
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
                    validator: (text) => text!.isEmpty ? 'required' : null,
                    hintText: 'E-mail',
                    controller: c.emailController,
                    obscureText: null,
                  ),
                ),
                YoJobTextField(
                  validator: (text) => text!.isEmpty ? 'required' : null,
                  hintText: 'Password',
                  controller: c.passwordController,
                  obscureText: true,
                ),
                SpacingDimens.xlargeSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    YoJobButton(
                      onPressed: c.signInWithEmailPassword,
                      buttonText: 'Sign in',
                      fontSize: 24.0,
                    ),
                  ],
                ),
                SpacingDimens.xlargeSpacer,
                InkWell(
                  onTap: c.signInWithGoogle,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        )
                      ],
                    ),
                    width: 314.0,
                    height: 48.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('lib/assets/google_logo.svg'),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Sign in with Google',
                            style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(0, 0, 0, 0.6),
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SpacingDimens.xlargeSpacer,
                InkWell(
                  onTap: () => {
                    /// TODO: Add navigation to register screen
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const RegistrationPage(),
                    //   ),
                    // );
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.montserrat(
                      color: Colors.amber,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
