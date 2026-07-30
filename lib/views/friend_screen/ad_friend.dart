import 'package:creater_project/controllers/friendctrl.dart';
import 'package:creater_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdFriend extends StatelessWidget {
  const AdFriend({super.key});

  @override
  Widget build(BuildContext context) {
    final Frendctrl ctrl1 = Get.put(Frendctrl());
    return Scaffold(
body: Column(
  children: [
    CustomTextField(text: "", keyboardType: TextInputType.text, controller: ctrl1.namectrl, hintText: ''),
    ElevatedButton(
      onPressed:() {
        ctrl1.addfriend();
      }
    , child: Text('data'))
  

  ],
),
    );
  }
}