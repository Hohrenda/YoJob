import 'package:YoJob/models/authorization/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get currentFirestoreUserStream => _firebaseAuth.userChanges();

  Future<void> createUserProfile(UserProfile user) async {
    await _firestore.doc("users/${user.userId}").set(user.toJson());
  }

  Future<bool> isUserExists(String? uid) async {
    try {
      final userDoc = await _firestore.doc("users/$uid").get();
      return userDoc.exists;
    } catch (e) {
      return false;
    }
  }

  Stream<UserProfile?> currentUserProfileStream(String userId) {
    return _firestore
        .doc("users/$userId")
        .snapshots()
        .map<UserProfile?>((snapshot) {
      if (snapshot.data() != null) {
        return UserProfile.fromDocument(snapshot);
      }
    });
  }
}