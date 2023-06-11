import 'package:YoJob/clients/vacancies_client.dart';
import 'package:YoJob/managers/auth_manager.dart';
import 'package:YoJob/models/me/vacancie_model.dart';
import 'package:get/get.dart';

class VacanciesManager extends GetLifeCycle {
  final VacanciesClient _client = Get.find();
  final AuthManager _authManager = Get.find();
  RxList<VacancyModel> vacanciesList = <VacancyModel>[].obs;
  RxList<String> presentCategories = <String>[].obs;
  RxList<String> presentCities = <String>[].obs;
  Rxn<VacancyModel> selectedVacancy = Rxn();
  final RxBool isLoading = false.obs;
  final RxBool shouldUpdate = false.obs;

  Future<void> getAllVacancies() async {
    isLoading.value = true;
    vacanciesList.value = await _client
        .getAllVacancies(_authManager.currentUser!.firebaseUser!.uid);
    isLoading.value = false;
  }

  Future<void> addVacancy(VacancyModel vacancyModel) async {
    isLoading.value = true;
    shouldUpdate.value = true;
    if (_authManager.currentUser?.firebaseUser?.uid != null) {
      await _client
          .createVacancy(
        userId: _authManager.currentUser!.firebaseUser!.uid,
        vacancyModel: vacancyModel,
      )
          .then(
        (_) {
          vacanciesList.add(vacancyModel);
          if (vacancyModel.vacancyCity != null &&
              !presentCities().contains(vacancyModel.vacancyCity)) {
            presentCities().add(vacancyModel.vacancyCity!);
          }
          if (vacancyModel.vacancyCategory != null &&
              !presentCategories().contains(vacancyModel.vacancyCategory)) {
            presentCategories().add(vacancyModel.vacancyCategory!);
          }
          Get.back();
        },
      );
    }
    isLoading.value = false;
  }

  Future<void> updateVacancy(VacancyModel vacancyModel) async {
    isLoading.value = true;
    shouldUpdate.value = true;
    await _client.updateVacancy(vacancyModel).then(
          (value) => getAllVacancies(),
        );
    isLoading.value = false;
  }

  Future<void> deleteVacancy(VacancyModel vacancyModel) async {
    isLoading.value = true;
    shouldUpdate.value = true;
    await _client.deleteVacancy(vacancyModel);
    vacanciesList().removeWhere(
      (listVacancy) => listVacancy.id == vacancyModel.id,
    );
    isLoading.value = false;
  }
}
