import 'package:cloud_firestore/cloud_firestore.dart';

class VacancyModel {
  VacancyModel({
    this.vacancyName,
    this.vacancyCity,
    this.vacancyCategory,
    this.vacancyDescription,
  });

  final String? vacancyName;
  final String? vacancyCity;
  final String? vacancyCategory;
  final String? vacancyDescription;

  Map<String, Object?> toJson() {
    return {
      'vacancyName': vacancyName,
      'vacancyCity': vacancyCity,
      'vacancyCategory': vacancyCategory,
      'vacancyDescription': vacancyDescription,
    };
  }

  factory VacancyModel.fromJson(Map<String, dynamic> doc, String userId) {
    VacancyModel user = VacancyModel(
      vacancyName: doc['vacancyName'],
      vacancyCity: doc['vacancyCity'],
      vacancyCategory: doc['vacancyCategory'],
      vacancyDescription: doc['vacancyDescription'],
    );
    return user;
  }

  factory VacancyModel.fromDocument(DocumentSnapshot doc) {
    return VacancyModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  VacancyModel copyWith({
    String? vacancyName,
    String? vacancyCity,
    String? vacancyCategory,
    String? vacancyDescription,
  }) {
    return VacancyModel(
      vacancyName: vacancyName ?? this.vacancyName,
      vacancyCity: vacancyCity ?? this.vacancyCity,
      vacancyCategory: vacancyCategory ?? this.vacancyCategory,
      vacancyDescription: vacancyDescription ?? this.vacancyDescription,
    );
  }
}
