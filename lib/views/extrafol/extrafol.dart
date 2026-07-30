import 'package:creater_project/controllers/loginctrl.dart';
import 'package:creater_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Protect extends StatelessWidget {
  Protect({super.key});
  final Loginctrl ctrl = Get.put(Loginctrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
           Obx( 
        ()=> Text('Reslut = ${ctrl.result.value}',style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)),
     
      CustomTextField(text: 'num1', keyboardType:TextInputType.number, controller: ctrl.ctrl1, hintText: 'number'),
      CustomTextField(text: 'num2', keyboardType:TextInputType.number, controller: ctrl.ctrl2, hintText: 'number'),



 Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [

              Row(
                children: [
              ElevatedButton(
                onPressed: () => ctrl.add(),
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () => ctrl.subtract(),
                child: const Text('-'),
              ),
                ]
              ),
Row(
  children: [

  
              ElevatedButton(
                onPressed: () => ctrl.multiply(),
                child: const Text('*'),
              ),
              ElevatedButton(
                onPressed: () => ctrl.divide(),
                child: const Text('/'),
              ),
              ],
),
              ElevatedButton(
                onPressed: () => ctrl.modulus(),
                child: const Text('%'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}