import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class Frendctrl extends GetxController {
  @override
  void onInit() {
    
    final allfriends = box.read('friend');
    friends.assignAll((List.from(allfriends ?? [''])));
    names.value = box.read('name')?? 'no value here'; 
    
    super.onInit();
  }

  final box = GetStorage();
  final TextEditingController namectrl = TextEditingController();
  RxString names  = ''.obs;
  RxList friends = [''].obs;
  void addfriend() async{
  friends.add(namectrl.text);
  box.write('friend', friends.toList());
  // names.value = box.read('name');
  
}

}