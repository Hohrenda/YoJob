import 'package:YoJob/managers/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final AuthManager manager = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signInWithGoogle() {
    manager.signInWithGoogle();
  }

  void signInWithEmailPassword() {
    manager.signInWithEmailPassword(
      emailController.text,
      passwordController.text,
    );
  }
}
