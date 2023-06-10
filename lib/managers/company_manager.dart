import 'package:YoJob/clients/company_client.dart';
import 'package:YoJob/managers/auth_manager.dart';
import 'package:YoJob/models/me/company_model.dart';
import 'package:get/get.dart';

class CompanyManager extends GetLifeCycle {
  final CompanyClient _companyClient = Get.find();
  final AuthManager _authManager = Get.find();
  final Rxn<CompanyModel> currentCompanyInfo = Rxn();
  final RxBool isLoading = false.obs;

  @override
  void onInit(){
    getCompany();
    super.onInit();
  }

  Future<void> getCompany() async {
    isLoading.value = true;
    await _companyClient
        .getCompanyInfo(_authManager.currentUser!.profile!.userId!)
        .then((companyInfo) => currentCompanyInfo.value = companyInfo);
    isLoading.value = false;
  }

  Future<void> addCompanyInfo(CompanyModel companyModel) async {
    isLoading.value = true;
    if (_authManager.currentUser?.profile?.userId != null) {
      await _companyClient
          .createUserCompany(
            userId: _authManager.currentUser!.profile!.userId!,
            companyModel: companyModel,
          )
          .then(
            (_) => currentCompanyInfo.value = companyModel,
          );
    }
    isLoading.value = false;
  }
}
