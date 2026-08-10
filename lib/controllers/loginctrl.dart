// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creater_project/views/landing_page/landing_page.dart';
import 'package:creater_project/views/login%20page/login_page.dart';
import 'package:creater_project/views/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Loginctrl extends GetxController {
  final box = GetStorage();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController cnicCtrl = TextEditingController();
  final TextEditingController bloodCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();


  // final TextEditingController ctrl1 = TextEditingController();
  // final TextEditingController ctrl2 = TextEditingController();

  final firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkSignupStatus();
    });
  }

  void checkSignupStatus() {
    final bool isSignedUp = box.read('isSignedUp') ?? false;

    if (isSignedUp) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => const Signup());
    }
  }



  Future<void> signupbutton() async {
    final auth = FirebaseAuth.instance;

    try {
          await auth.createUserWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );

      final uid = auth.currentUser?.uid;
      await firebaseFirestore.collection('student').doc(uid).set({
        'name': nameCtrl.text,
        'email': emailCtrl.text,
        'phone': phoneCtrl.text,
        'cnic': cnicCtrl.text,
        'bloodGroup': bloodCtrl.text,
      });

      await box.write('isSignedUp', true);

      Get.snackbar(
        'Success',
        'Account created successfully',
        snackPosition: SnackPosition.TOP,
      );

      print('Account Created');
      print('UID: $uid');
      print('Email: ${emailCtrl.text}');
      Get.offAll(() => LoginPage());

    } on FirebaseAuthException catch (e) {
      print('Signup Error: ${e.code}');
      print(e.message);

      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'This email is already registered.',
        );
      } else if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'Password is too weak.',
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'Please enter a valid email.',
        );
      } else {
        Get.snackbar(
          'Error',
          e.message ?? 'Signup failed.',
        );
      }
    } catch (e) {
      print('Error: $e');

      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
      );
    }
  }



  Future<void> loginbutton(email, passs) async {
    final auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: passs,
      );

      Get.snackbar(
        'Success',
        'Login successful',
      );

      await box.write('isSignedUp', true);

      Get.offAll(() => LandingPage());
    } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.message}');
      print('Login failed: ${e.code}');

      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
        );
      } else if (e.code == 'invalid-credential') {
        Get.snackbar(
          'Error',
          'Invalid email or password.',
        );
      } else {
        Get.snackbar(
          'Error',
          e.message ?? 'An error occurred',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );
    }
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    cnicCtrl.dispose();
    bloodCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();

    // ctrl1.dispose();
    // ctrl2.dispose();

    super.onClose();
  }















  // RxString name = "ghasugwie".obs;
  // RxDouble result = 0.0.obs;

  // String changename(){
  //   return name.value = ctrl1.text;
  // }
  //  double _num1() => double.tryParse(ctrl1.text) ?? 0;
  //  double _num2() => double.tryParse(ctrl2.text) ?? 0;


  //   void add() {
  //   result.value = _num1() + _num2();
  // }

  // void subtract() {
  //   result.value = _num1() - _num2();
  // }

  // void multiply() {
  //   result.value = _num1() * _num2();
  // }

  // void divide() {
  //   if (_num2() == 0) {
  //     result.value = 0;
  //   } else {
  //     result.value = _num1() / _num2();
  //   }
  // }

  // void modulus() {
  //   if (_num2() == 0) {
  //     result.value = 0;
  //   } else {
  //     result.value = _num1() % _num2();
  //   }
  // }


 

}