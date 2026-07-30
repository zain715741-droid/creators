import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginctrl extends GetxController{
  final TextEditingController ctrl1 = TextEditingController();
  final TextEditingController ctrl2 = TextEditingController();
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