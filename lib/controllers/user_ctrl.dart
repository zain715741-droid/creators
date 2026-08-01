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

  Rx<XFile?> image = Rx<XFile?>(null); // temporary - form fill karte waqt

  // YE SABSE ZAROORI HAI - saari entries ki list
  RxList entries = [].obs;
  var searchText = ''.obs;

  List get filteredEntries {
  if (searchText.value.isEmpty) return entries;
  return entries.where((entry) {
    final name = (entry['name'] ?? '').toString().toLowerCase();
    return name.contains(searchText.value.toLowerCase());
  }).toList();
}

  @override
  void onInit() {
    super.onInit();
    // App start hote hi GetStorage se puri list load karo
    final savedList = box.read('entries');
    entries.assignAll(List.from(savedList ?? []));
  }

  Future<void> imagefunction() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = pickedFile;
    }
  }


  void deleteEntry(int index) {
  entries.removeAt(index);
  box.write('entries', entries.toList());}

  void saveData() {
    // Ek naya "packet" (Map) banaya jisme is entry ki saari cheezein hain
    Map newEntry = {
      'name': namectrl.text,
      'age': agectrl.text,
      'email': emailctrl.text,
      'phone': phonectrl.text,
      'address': addressctrl.text,
      'imagePath': image.value != null ? image.value!.path : '',
    };

    // Naya packet list ke END mein add kiya
    entries.add(newEntry);

    // Poori list (sab purani + ye nayi entry) permanently save ki
    box.write('entries', entries.toList());

    // Fields ko khali kar do taake agli entry ke liye form saaf ho
    namectrl.clear();
    agectrl.clear();
    emailctrl.clear();
    phonectrl.clear();
    addressctrl.clear();
    image.value = null;
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class UserCtrl extends GetxController {

//   final box = GetStorage();

//   final ImagePicker picker = ImagePicker();

//   final TextEditingController namectrl = TextEditingController();
//   final TextEditingController agectrl = TextEditingController();
//   final TextEditingController emailctrl = TextEditingController();
//   final TextEditingController phonectrl = TextEditingController();
//   final TextEditingController addressctrl = TextEditingController();
  
 
//   Rx<XFile?> image = Rx<XFile?>(null);
  
//   var name = ''.obs;
//   var age = ''.obs;
//   var email = ''.obs;
//   var phone = ''.obs;
//   var address = ''.obs;
//   var imagePath = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     name.value = box.read('name') ?? '';
//     age.value = box.read('age') ?? '';
//     email.value = box.read('email') ?? '';
//     phone.value = box.read('phone') ?? '';
//     address.value = box.read('address') ?? '';
//     imagePath.value = box.read('imagePath') ?? '';

//     // TextFields mein bhi purana data dikhane ke liye
//     // namectrl.text = name.value;
//     // agectrl.text = age.value;
//     // emailctrl.text = email.value;
//     // phonectrl.text = phone.value;
//     // addressctrl.text = address.value;
//   }
    
//  imagefunction() async {
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     image.value = pickedFile;
//   }
// }


//   void saveData() {
//     name.value = namectrl.text;
//     age.value = agectrl.text;
//     email.value = emailctrl.text;
//     phone.value = phonectrl.text;
//     address.value = addressctrl.text;

//     box.write('name', name.value);
//     box.write('age', age.value);
//     box.write('email', email.value);
//     box.write('phone', phone.value);
//     box.write('address', address.value);

//     if (image.value != null) {
//       imagePath.value = image.value!.path;
//       box.write('imagePath', imagePath.value);
//     }
//   }
// }