import 'package:YoJob/managers/auth_manager.dart';
import 'package:YoJob/managers/company_manager.dart';
import 'package:YoJob/managers/vacancies_manager.dart';
import 'package:YoJob/models/me/company_model.dart';
import 'package:YoJob/paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeController extends GetxController {
  final AuthManager _authManager = Get.find();
  final CompanyManager _companyManager = Get.find();
  final RxBool isLoading = false.obs;
  final RxInt selectedTab = 1.obs;
  final TextEditingController cityFilterController = TextEditingController();
  final TextEditingController categoryFilterController =
      TextEditingController();

  CompanyModel? get companyInfo => _companyManager.currentCompanyInfo();

  void updateListener(){
    Get.find<VacanciesManager>().shouldUpdate.value = true;
  }

  @override
  void onInit() {
    isLoading.value = true;
    _companyManager.getCompany().then(
      (_) {
        if (companyInfo != null) {
          // At this point the data should be ready for display
          isLoading.value = false;
          Get.find<VacanciesManager>().getAllVacancies();
        } else {
          Get.toNamed(AuthPaths.companyEdition);
        }
      },
    );

    cityFilterController.addListener(() => updateListener());
    categoryFilterController.addListener(() => updateListener());

    super.onInit();
  }

  void logout() {
    _authManager.logOut();
  }

  @override
  void onClose() {
    cityFilterController.removeListener(updateListener);
    categoryFilterController.removeListener(updateListener);
    cityFilterController.dispose();
    categoryFilterController.dispose();
    super.onClose();
  }
}
