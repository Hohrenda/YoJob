import 'package:YoJob/managers/company_manager.dart';
import 'package:YoJob/models/me/company_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyEditionController extends GetxController {
  final CompanyManager _companyManager = Get.find();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController industryNameController = TextEditingController();
  final TextEditingController websiteLinkController = TextEditingController();
  final TextEditingController employeesCountController =
      TextEditingController();
  final TextEditingController companyDescriptionController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  final Rx<AutovalidateMode> autoValidateMode = AutovalidateMode.disabled.obs;

  bool get isLoading => _companyManager.isLoading();

  CompanyModel? get companyInfo => _companyManager.currentCompanyInfo();

  void updateCompanyInfo() {
    autoValidateMode.value = AutovalidateMode.always;

    if (formKey.currentState!.validate()) {
      _companyManager.addCompanyInfo(
        CompanyModel(
          companyName: companyNameController.text,
          industryName: industryNameController.text,
          websiteLink: websiteLinkController.text,
          employeesCount: employeesCountController.text,
          companyDescription: companyDescriptionController.text,
        ),
      );
    }
  }

  @override
  void onClose() {
    companyNameController.dispose();
    websiteLinkController.dispose();
    companyDescriptionController.dispose();
    super.onClose();
  }
}
