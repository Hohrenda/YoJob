import 'package:YoJob/models/authorization/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoggedUserModel {
  final User? firebaseUser;
  final UserProfile? profile;

  LoggedUserModel(this.firebaseUser, this.profile);
}