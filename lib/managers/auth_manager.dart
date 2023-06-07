import 'dart:async';

import 'package:YoJob/clients/auth_client.dart';
import 'package:YoJob/models/authorization/logged_user_model.dart';
import 'package:YoJob/models/authorization/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager extends GetLifeCycle {
  final AuthClient _userRepository = AuthClient();

  StreamSubscription? _currentUserProfileSubscription;

  final Rx<LoggedUserModel?> _currentUser = Rxn();

  LoggedUserModel? get currentUser => _currentUser();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    _userRepository.currentFirestoreUserStream.listen(_firebaseUserListener);
    super.onInit();
  }

  set _currentUserProfile(UserProfile? userProfile) {
    if (userProfile?.userId == _currentUser()?.firebaseUser?.uid) {
      _currentUser.value = LoggedUserModel(
        _currentUser()?.firebaseUser,
        userProfile,
      );
    }
  }

  Future<void> _firebaseUserListener(User? firebaseUser) async {
    _currentUser.value = LoggedUserModel(firebaseUser, _currentUser()?.profile);

    if (firebaseUser != null) {
      _currentUserProfileSubscription?.cancel();
      _currentUserProfileSubscription = _userRepository
          .currentUserProfileStream(firebaseUser.uid)
          .listen(_userProfileListener);
    } else {
      _currentUserProfile = null;
    }
  }

  void _userProfileListener(UserProfile? profile) async {
    _currentUserProfile = profile;
    if (profile == null) {
      final bool isProfileExist =
          await isUserProfileExist(profile?.userId.toString());

      if (!isProfileExist) await _createUserProfile();
    }
  }

  Future<void> _createUserProfile() async {
    UserProfile userProfile = UserProfile(
      userId: _currentUser()?.firebaseUser?.uid,
      userName: _currentUser()?.firebaseUser?.displayName,
      email: _currentUser()?.firebaseUser?.email,
    );
    _currentUserProfile = userProfile;
    addUser(userProfile);
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> registerNewUser(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logOut() async {
    _currentUserProfile = null;
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleUser.authentication;
        if (googleSignInAuthentication.accessToken != null) {
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          await firebaseAuth.signInWithCredential(credential);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addUser(UserProfile user) async {
    await _userRepository.createUserProfile(user);
  }

  Future<bool> isUserProfileExist(String? userId) async {
    return await _userRepository.isUserExists(userId);
  }
}
