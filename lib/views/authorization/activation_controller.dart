import 'package:YoJob/managers/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivationController extends GetxController {
  final AuthManager _manager = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signUpWithEmailAndPassword() {
    _manager.registerNewUser(
      emailController.text,
      passwordController.text,
    );
  }
}
