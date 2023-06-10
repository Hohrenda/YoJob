import 'package:YoJob/managers/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final AuthManager _manager = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Rx<AutovalidateMode> autoValidateMode = AutovalidateMode.disabled.obs;

  bool get isLoading => _manager.isLoading();

  void signInWithGoogle() {
    _manager.signInWithGoogle();
  }

  void signInWithEmailPassword() {
    autoValidateMode.value = AutovalidateMode.always;

    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _manager.signInWithEmailPassword(
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
