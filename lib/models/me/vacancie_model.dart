import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyModel {
  VacancyModel({
    this.id,
    this.companyId,
    this.vacancyName,
    this.vacancyCity,
    this.vacancyCategory,
    this.vacancyDescription,
  });

  final String? id;
  final String? companyId;
  final String? vacancyName;
  final String? vacancyCity;
  final String? vacancyCategory;
  final String? vacancyDescription;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'vacancyName': vacancyName,
      'vacancyCity': vacancyCity,
      'vacancyCategory': vacancyCategory,
      'vacancyDescription': vacancyDescription,
    };
  }

  factory VacancyModel.fromJson(Map<String, dynamic> doc, String? documentId) {
    VacancyModel user = VacancyModel(
      id: documentId ?? doc['id'],
      companyId: doc['companyId'],
      vacancyName: doc['vacancyName'],
      vacancyCity: doc['vacancyCity'],
      vacancyCategory: doc['vacancyCategory'],
      vacancyDescription: doc['vacancyDescription'],
    );
    return user;
  }

  factory VacancyModel.fromDocument(DocumentSnapshot doc) {
    print('ID BY DOC - ${doc.id}');
    print(doc);
    return VacancyModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  VacancyModel copyWith({
    String? companyId,
    String? vacancyName,
    String? vacancyCity,
    String? vacancyCategory,
    String? vacancyDescription,
  }) {
    return VacancyModel(
      id: id,
      companyId: companyId ?? this.companyId,
      vacancyName: vacancyName ?? this.vacancyName,
      vacancyCity: vacancyCity ?? this.vacancyCity,
      vacancyCategory: vacancyCategory ?? this.vacancyCategory,
      vacancyDescription: vacancyDescription ?? this.vacancyDescription,
    );
  }
}
