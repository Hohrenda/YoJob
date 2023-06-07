import 'package:YoJob/clients/auth_client.dart';
import 'package:YoJob/managers/auth_manager.dart';
import 'package:get/get.dart';

abstract class Services {
  static Future<void> init() async {
    initClients();
    await initManagers();
  }

  static void initClients() {
    Get.lazyPut<AuthClient>(() => AuthClient(), fenix:  true,);
  }

  static Future<void> initManagers() async {
    Get.lazyPut<AuthManager>(() => AuthManager());
  }
}