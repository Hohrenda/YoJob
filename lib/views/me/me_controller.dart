import 'package:YoJob/managers/auth_manager.dart';
import 'package:YoJob/managers/company_manager.dart';
import 'package:YoJob/models/me/company_model.dart';
import 'package:YoJob/paths.dart';
import 'package:get/get.dart';

class MeController extends GetxController {
  final AuthManager _authManager = Get.find();
  final CompanyManager _companyManager = Get.find();
  final RxBool isLoading = false.obs;

  CompanyModel? get companyInfo => _companyManager.currentCompanyInfo();

  @override
  void onInit() {
    isLoading.value = true;
    _companyManager.getCompany().then(
      (_) {
        if (companyInfo != null) {
          // At this point the data should be ready for display
          isLoading.value = false;
        } else {
          Get.toNamed(AuthPaths.companyEdition);
        }
      },
    );

    super.onInit();
  }

  void logout() {
    _authManager.logOut();
  }
}
