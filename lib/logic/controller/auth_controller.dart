import 'package:ecommerce_with_mvc/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibilty = true;
  bool check = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String displayNameUser = '';
  String displayPhotoUser = '';
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLogged = false;
  final GetStorage authBox = GetStorage();

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkIcon() {
    check = !check;
    update();
  }

  void signUpWithFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((_) {
        displayNameUser = name;
        auth.currentUser?.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainPage);
      isLogged = true;
      authBox.write("auth", isLogged);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), '').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'Password is too weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
      );
    }
  }

  void logInWithFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((_) {
        displayNameUser = auth.currentUser!.displayName!;
      });
      update();
      Get.offNamed(Routes.mainPage);
      isLogged = true;
      authBox.write("auth", isLogged);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), '').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
      );
    }
  }

  void resetPasswordWithFirebase({
    required String email,
  }) async {
    await auth.sendPasswordResetEmail(email: email);
    update();
    Get.back();
  }

  void logInWithGoogleFirebase() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayNameUser = googleUser!.displayName!;
      displayPhotoUser = googleUser.photoUrl!;
      update();
      Get.offNamed(Routes.mainPage);
      isLogged = true;
      authBox.write("auth", isLogged);
    } on Exception catch (error) {
      Get.snackbar(
        'error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try {
      //signout google , facebook (Required)
      await auth.signOut();
      displayNameUser = '';
      displayPhotoUser = '';
      update();
      Get.offNamed(Routes.loginPage);
      isLogged = false;
      authBox.remove("auth");
    } catch (error) {
      Get.snackbar(
        'error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
      );
    }
  }
}
