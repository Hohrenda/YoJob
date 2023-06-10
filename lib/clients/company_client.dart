import 'package:YoJob/models/me/company_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyClient {
  final _firestore = FirebaseFirestore.instance;
  final String companyEndpoint = 'Companies/';

  Future<bool> doesUserCompanyExist(String userId) async {
    try {
      final companyInfo = await _firestore.doc("$companyEndpoint$userId").get();
      return companyInfo.exists;
    } catch (e) {
      return false;
    }
  }

  Future<CompanyModel> getCompanyInfo(String userId) async {
    final CompanyModel? companyInfo;

    companyInfo = await _firestore
        .doc("$companyEndpoint$userId")
        .snapshots()
        .map<CompanyModel>((snapshot) => CompanyModel.fromDocument(snapshot))
        .first;

    return companyInfo;
  }

  Future<void> createUserCompany({
    required CompanyModel companyModel,
    required String userId,
  }) async {
    await _firestore.doc("$companyEndpoint$userId").set(companyModel.toJson());
  }
}
