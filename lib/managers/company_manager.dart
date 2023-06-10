import 'package:YoJob/clients/company_client.dart';
import 'package:YoJob/managers/auth_manager.dart';
import 'package:YoJob/models/me/company_model.dart';
import 'package:get/get.dart';

class CompanyManager extends GetLifeCycle {
  final CompanyClient _companyClient = Get.find();
  final AuthManager _authManager = Get.find();
  final Rxn<CompanyModel> currentCompanyInfo = Rxn();
  final RxBool isLoading = false.obs;

  Future<void> getCompany() async {
    isLoading.value = true;
    currentCompanyInfo.value = await _companyClient
        .getCompanyInfo(_authManager.currentUser!.firebaseUser!.uid);
    isLoading.value = false;
  }

  Future<void> addCompanyInfo(CompanyModel companyModel) async {
    isLoading.value = true;
    if (_authManager.currentUser?.firebaseUser?.uid != null) {
      await _companyClient
          .createUserCompany(
        userId: _authManager.currentUser!.firebaseUser!.uid,
        companyModel: companyModel,
      )
          .then(
        (_) {
          currentCompanyInfo.value = companyModel;
          Get.back();
        },
      );
    }
    print('Company Updated!!!!');
    isLoading.value = false;
  }
}
