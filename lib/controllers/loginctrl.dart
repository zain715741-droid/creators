// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creater_project/views/landing_page/landing_page.dart';
import 'package:creater_project/views/login%20page/login_page.dart';
import 'package:creater_project/views/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Loginctrl extends GetxController{

  final box = GetStorage();
  final TextEditingController ctrl1 = TextEditingController();
  final TextEditingController ctrl2 = TextEditingController();
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


 void signupbutton(){
  final auth = FirebaseAuth.instance;

  auth.
  createUserWithEmailAndPassword(
    email: ctrl1.text,
    password: ctrl2.text,
  ).then((value) {
        firebaseFirestore.collection('student').doc(auth.currentUser?.uid).set({
          'email': ctrl1.text,
          'uid': auth.currentUser?.uid,
          'password': ctrl2.text,



          
        });

    Get.snackbar('Success', 'Account created successfully');
    box.write('isSignedUp', true);
    print(auth.currentUser?.email);
    print(auth.currentUser?.uid);
  }).catchError((error) {
    Get.snackbar('Error', error.toString());
  });

 }

 // ignore: strict_top_level_inference
 Future loginbutton( email , passs )async{
final auth =  FirebaseAuth.instance;
 try {await auth.signInWithEmailAndPassword(email: email, password: passs).then((value) {
    Get.snackbar('Success', 'Login successful');
    box.write('isSignedUp', true);
    Get.to(() => LandingPage());
  });} on FirebaseAuthException catch (e) {
    print('Login failed: ${e.message}');
    print('Login failed: ${e.code}');
    if (e.code == 'user-not-found') {
      Get.snackbar('Error', 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      Get.snackbar('Error', 'Wrong password provided for that user.');
    } else {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    }
  } catch (e) {
    Get.snackbar('Error', e.toString());
  } 
 }
















  RxString name = "ghasugwie".obs;
  RxDouble result = 0.0.obs;

  String changename(){
    return name.value = ctrl1.text;
  }
   double _num1() => double.tryParse(ctrl1.text) ?? 0;
   double _num2() => double.tryParse(ctrl2.text) ?? 0;


    void add() {
    result.value = _num1() + _num2();
  }

  void subtract() {
    result.value = _num1() - _num2();
  }

  void multiply() {
    result.value = _num1() * _num2();
  }

  void divide() {
    if (_num2() == 0) {
      result.value = 0;
    } else {
      result.value = _num1() / _num2();
    }
  }

  void modulus() {
    if (_num2() == 0) {
      result.value = 0;
    } else {
      result.value = _num1() % _num2();
    }
  }


 

}