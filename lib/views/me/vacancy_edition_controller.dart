import 'package:YoJob/managers/auth_manager.dart';
import 'package:YoJob/managers/vacancies_manager.dart';
import 'package:YoJob/models/me/vacancie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VacancyEditionController extends GetxController {
  final VacanciesManager _vacanciesManager = Get.find();
  final AuthManager _authManager = Get.find();
  final formKey = GlobalKey<FormState>();
  final Rx<AutovalidateMode> autoValidateMode = AutovalidateMode.disabled.obs;
  final TextEditingController jobNameController = TextEditingController();
  final TextEditingController jobCityController = TextEditingController();
  final TextEditingController jobCategoryController = TextEditingController();
  final TextEditingController jobDescriptionController =
      TextEditingController();

  bool get isLoading => _vacanciesManager.isLoading();

  bool get isEditing => _vacanciesManager.selectedVacancy() != null;

  VacancyModel? get selectedVacancy => _vacanciesManager.selectedVacancy();

  @override
  void onInit() {
    if (isEditing) {
      jobNameController.text = selectedVacancy?.vacancyName ?? '';
      jobCityController.text = selectedVacancy?.vacancyCity ?? '';
      jobCategoryController.text = selectedVacancy?.vacancyCategory ?? '';
      jobDescriptionController.text = selectedVacancy?.vacancyDescription ?? '';
    }
    super.onInit();
  }

  void saveVacancy() {
    autoValidateMode.value = AutovalidateMode.always;
    VacancyModel vacancyModel = VacancyModel(
      id: selectedVacancy?.id,
      companyId: _authManager.currentUser!.firebaseUser!.uid,
      vacancyName: jobNameController.text,
      vacancyCity: jobCityController.text,
      vacancyCategory: jobCategoryController.text,
      vacancyDescription: jobDescriptionController.text,
    );

    if(formKey.currentState!.validate()){
      if (isEditing) {
        _vacanciesManager.updateVacancy(vacancyModel);
      } else {
        _vacanciesManager.addVacancy(vacancyModel);
      }
    }

    if(isEditing) {
      _vacanciesManager.selectedVacancy.value = null;
    }

    Get.back();
  }

  void onBack() {
    _vacanciesManager.selectedVacancy.value = null;
    Get.back();
  }

  @override
  void onClose() {
    jobNameController.dispose();
    jobCityController.dispose();
    jobCategoryController.dispose();
    jobDescriptionController.dispose();
    _vacanciesManager.selectedVacancy.value = null;
    super.onClose();
  }
}
