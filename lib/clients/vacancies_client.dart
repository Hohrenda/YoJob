import 'package:YoJob/managers/vacancies_manager.dart';
import 'package:YoJob/models/me/vacancie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class VacanciesClient {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String vacancyEndpoint = 'vacancies/';

  Future<void> createVacancy({
    required VacancyModel vacancyModel,
    required String userId,
  }) async {
    await _firestore.collection(vacancyEndpoint).add(vacancyModel.toJson());
  }

  Future<void> updateVacancy(VacancyModel vacancyModel) async {
    print(vacancyModel.id);
    await _firestore.doc("$vacancyEndpoint${vacancyModel.id}").set(
          vacancyModel.toJson(),
        );
  }

  Future<void> deleteVacancy(VacancyModel vacancyModel) async {
    await _firestore.collection(vacancyEndpoint).doc(vacancyModel.id).delete();
  }

  Future<List<VacancyModel>> getAllVacancies(String userId) async {
    List<VacancyModel> vacancies = [];
    VacanciesManager vacanciesManager = Get.find();

    QuerySnapshot querySnapshot = await _firestore
        .collection(vacancyEndpoint)
        .where('companyId', isEqualTo: userId)
        .get();


    vacancies.addAll(
      querySnapshot.docs.map(
        (doc) {
          VacancyModel vacancyModel = VacancyModel.fromDocument(doc);
          if (vacancyModel.vacancyCity != null) {
            vacanciesManager.presentCities.add(vacancyModel.vacancyCity!);
          }
          if (vacancyModel.vacancyCategory != null) {
            vacanciesManager.presentCategories
                .add(vacancyModel.vacancyCategory!);
          }
          return vacancyModel;
        },
      ),
    );

    return vacancies;
  }
}
