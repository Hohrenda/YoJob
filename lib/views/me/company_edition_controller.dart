import 'package:YoJob/managers/company_manager.dart';
import 'package:YoJob/models/me/company_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyEditionController extends GetxController {
  final CompanyManager _companyManager = Get.find();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyContactEmailController =
      TextEditingController();
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

  @override
  void onInit() {
    if (companyInfo != null) {
      companyNameController.text = companyInfo?.companyName ?? '';
      companyContactEmailController.text =
          companyInfo?.companyContactEmail ?? '';
      industryNameController.text = companyInfo?.industryName ?? '';
      websiteLinkController.text = companyInfo?.websiteLink ?? '';
      employeesCountController.text = companyInfo?.employeesCount ?? '';
      companyDescriptionController.text = companyInfo?.companyDescription ?? '';
    }
    super.onInit();
  }

  void updateCompanyInfo() {
    autoValidateMode.value = AutovalidateMode.always;

    if (formKey.currentState!.validate()) {
      _companyManager
          .addCompanyInfo(
        CompanyModel(
          companyName: companyNameController.text,
          industryName: industryNameController.text,
          websiteLink: websiteLinkController.text,
          employeesCount: employeesCountController.text,
          companyDescription: companyDescriptionController.text,
          companyContactEmail: companyContactEmailController.text,
        ),
      )
          .then((_) {
        if (_companyManager.currentCompanyInfo() != null) {
          Get.back();
        }
      });
    }
  }

  @override
  void onClose() {
    companyNameController.dispose();
    companyContactEmailController.dispose();
    websiteLinkController.dispose();
    industryNameController.dispose();
    companyDescriptionController.dispose();
    employeesCountController.dispose();
    super.onClose();
  }
}
