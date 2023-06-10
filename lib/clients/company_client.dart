import 'package:YoJob/models/me/company_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyClient {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String companyEndpoint = 'companies/';

  Future<CompanyModel?> getCompanyInfo(String userId) async {
    CompanyModel? companyInfo;
    final bool doesCompany = await _doesCompanyExist(userId);

    if(doesCompany){
      companyInfo = await _firestore
          .doc("$companyEndpoint$userId")
          .snapshots()
          .map<CompanyModel?>((snapshot) => CompanyModel.fromDocument(snapshot))
          .first;
    }

    return companyInfo;
  }

  Future<bool> _doesCompanyExist(String? userId) async {
    try {
      final companyDoc = await _firestore.doc("$companyEndpoint$userId").get();
      return companyDoc.exists;
    } catch (e) {
      return false;
    }
  }

  Future<void> createUserCompany({
    required CompanyModel companyModel,
    required String userId,
  }) async {
    await _firestore.doc("$companyEndpoint$userId").set(companyModel.toJson());
  }
}
