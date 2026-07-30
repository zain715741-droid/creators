import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class UserCtrl extends GetxController {

  final box = GetStorage();

  final ImagePicker picker = ImagePicker();

  final TextEditingController namectrl = TextEditingController();
  final TextEditingController agectrl = TextEditingController();
  final TextEditingController emailctrl = TextEditingController();
  final TextEditingController phonectrl = TextEditingController();
  final TextEditingController addressctrl = TextEditingController();
  
 
  Rx<XFile?> image = Rx<XFile?>(null);
  
  var name = ''.obs;
  var age = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var address = ''.obs;
  var imagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    name.value = box.read('name') ?? '';
    age.value = box.read('age') ?? '';
    email.value = box.read('email') ?? '';
    phone.value = box.read('phone') ?? '';
    address.value = box.read('address') ?? '';
    imagePath.value = box.read('imagePath') ?? '';

    // TextFields mein bhi purana data dikhane ke liye
    // namectrl.text = name.value;
    // agectrl.text = age.value;
    // emailctrl.text = email.value;
    // phonectrl.text = phone.value;
    // addressctrl.text = address.value;
  }
    
 imagefunction() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    image.value = pickedFile;
  }
}


  void saveData() {
    name.value = namectrl.text;
    age.value = agectrl.text;
    email.value = emailctrl.text;
    phone.value = phonectrl.text;
    address.value = addressctrl.text;

    box.write('name', name.value);
    box.write('age', age.value);
    box.write('email', email.value);
    box.write('phone', phone.value);
    box.write('address', address.value);

    if (image.value != null) {
      imagePath.value = image.value!.path;
      box.write('imagePath', imagePath.value);
    }
  }
}