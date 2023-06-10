import 'package:YoJob/managers/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivationController extends GetxController {
  final AuthManager _manager = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<AutovalidateMode> autoValidateMode = AutovalidateMode.disabled.obs;

  bool get isLoading => _manager.isLoading();

  void signUpWithEmailAndPassword() {
    autoValidateMode.value = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _manager.registerNewUser(
        emailController.text,
        passwordController.text,
      );
    }
  }

  @override
  void onClose(){
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
