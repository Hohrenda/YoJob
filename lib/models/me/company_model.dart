import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  CompanyModel({
    this.companyContactEmail,
    this.companyName,
    this.industryName,
    this.websiteLink,
    this.employeesCount,
    this.companyDescription,
  });

  final String? companyContactEmail;
  final String? companyName;
  final String? industryName;
  final String? websiteLink;
  final String? employeesCount;
  final String? companyDescription;

  Map<String, Object?> toJson() {
    return {
      'companyContactEmail': companyContactEmail,
      'companyName': companyName,
      'industryName': industryName,
      'websiteLink': websiteLink,
      'employeesCount': employeesCount,
      'companyDescription': companyDescription,
    };
  }

  factory CompanyModel.fromJson(Map<String, dynamic> doc, String userId) {
    CompanyModel user = CompanyModel(
      companyContactEmail: doc['companyContactEmail'],
      companyName: doc['companyName'],
      industryName: doc['industryName'],
      websiteLink: doc['websiteLink'],
      employeesCount: doc['employeesCount'],
      companyDescription: doc['companyDescription'],
    );
    return user;
  }

  factory CompanyModel.fromDocument(DocumentSnapshot doc) {
    return CompanyModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  CompanyModel copyWith({
    String? companyContactEmail,
    String? companyName,
    String? industryName,
    String? websiteLink,
    String? employeesCount,
    String? companyDescription,
  }) {
    return CompanyModel(
      companyContactEmail: companyContactEmail ?? this.companyContactEmail,
      companyName: companyName ?? this.companyName,
      industryName: industryName ?? this.industryName,
      websiteLink: websiteLink ?? this.websiteLink,
      employeesCount: employeesCount ?? this.employeesCount,
      companyDescription: companyDescription ?? this.companyDescription,
    );
  }
}
