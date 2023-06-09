import 'dart:async';

import 'package:YoJob/clients/auth_client.dart';
import 'package:YoJob/models/authorization/logged_user_model.dart';
import 'package:YoJob/models/authorization/user_profile.dart';
import 'package:YoJob/paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager extends GetLifeCycle {
  final AuthClient _authClient = AuthClient();

  StreamSubscription? _currentUserProfileSubscription;

  final Rx<LoggedUserModel?> _currentUser = Rxn();

  LoggedUserModel? get currentUser => _currentUser();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    _authClient.currentFirestoreUserStream.listen(_firebaseUserListener);
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

  void _navigateDependingOnLoginState() {
    if (_currentUser()?.firebaseUser != null &&
        UnauthPaths.allRoutes.contains(Get.currentRoute)) {
      Get.offAllNamed(AuthPaths.me);
    } else if (_currentUser()?.firebaseUser == null &&
        !UnauthPaths.allRoutes.contains(Get.currentRoute)) {
      Get.offAllNamed(UnauthPaths.root);
    }
  }

  Future<void> _firebaseUserListener(User? firebaseUser) async {
    _currentUser.value = LoggedUserModel(firebaseUser, _currentUser()?.profile);

    if (firebaseUser != null) {
      _currentUserProfileSubscription?.cancel();
      _currentUserProfileSubscription = _authClient
          .currentUserProfileStream(firebaseUser.uid)
          .listen(_userProfileListener);
    } else {
      _currentUserProfile = null;
    }

    _navigateDependingOnLoginState();
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
      isLoading.value = true;
      await firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((_) => isLoading.value = false);
    } catch (e) {
      isLoading.value = false;
      Get.showSnackbar(
        const GetSnackBar(
          message:
              '''We cannot find you account using the data you provided, please make sure that all fields are coorect''',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      print(e.toString());
    }
  }

  Future<void> registerNewUser(String email, String password) async {
    try {
      isLoading.value = true;
      await firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((_) => isLoading.value = false);
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
    await _authClient.createUserProfile(user);
  }

  Future<bool> isUserProfileExist(String? userId) async {
    return await _authClient.isUserExists(userId);
  }
}
