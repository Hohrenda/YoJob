import 'package:YoJob/managers/auth_manager.dart';
import 'package:get/get.dart';

class MeController extends GetxController {
  final AuthManager manager = Get.find();

  void logout() {
    manager.logOut();
  }
}