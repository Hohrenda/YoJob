import 'package:get/get.dart';

abstract class Services {
  static Future<void> init() async {
    await initManagers();
    await initControllers();
  }

  static Future<void> initControllers() async {}

  static Future<void> initManagers() async {}
}