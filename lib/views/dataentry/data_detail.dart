import 'dart:io';
import 'package:flutter/material.dart';

class EntryDetailScreen extends StatelessWidget {
  final Map entry;
  const EntryDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entry Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (entry['imagePath'] != '')
              Center(child: Image.file(File(entry['imagePath']), height: 150)),
            const SizedBox(height: 20),
            Text('Name: ${entry['name']}'),
            Text('Age: ${entry['age']}'),
            Text('Email: ${entry['email']}'),
            Text('Phone: ${entry['phone']}'),
            Text('Address: ${entry['address']}'),
          ],
        ),
      ),
    );
  }
}




















// import 'dart:io';
// import 'package:creater_project/controllers/user_ctrl.dart';
// import 'package:creater_project/views/Display/display_screen.dart';
// import 'package:creater_project/widgets/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DataEntryScreen extends StatelessWidget {
//   DataEntryScreen({super.key});
//   final UserCtrl ctrl = Get.put(UserCtrl());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: const Text('Enter Data'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Obx(() => InkWell(
//                 onTap: () {
//                   ctrl.imagefunction();
//                 },
//                 child: CircleAvatar(
//                   radius: 55,
//                   backgroundColor: Colors.blue.shade100,
//                   backgroundImage: ctrl.image.value != null ? FileImage(File(ctrl.image.value!.path)) : null,
//                   child: ctrl.image.value == null
//                       ? Icon(Icons.camera_alt, size: 30, color: Colors.blue.shade700)
//                       : null,
//                 ),
//               )),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 text: "",
//                 keyboardType: TextInputType.text,
//                 controller: ctrl.namectrl,
//                 hintText: 'Name',
//               ),
//               const SizedBox(height: 12),
//               CustomTextField(
//                 text: "",
//                 keyboardType: TextInputType.number,
//                 controller: ctrl.agectrl,
//                 hintText: 'Age',
//               ),
//               const SizedBox(height: 12),
//               CustomTextField(
//                 text: "",
//                 keyboardType: TextInputType.emailAddress,
//                 controller: ctrl.emailctrl,
//                 hintText: 'Email',
//               ),
//               const SizedBox(height: 12),
//               CustomTextField(
//                 text: "",
//                 keyboardType: TextInputType.phone,
//                 controller: ctrl.phonectrl,
//                 hintText: 'Phone',
//               ),
//               const SizedBox(height: 12),
//               CustomTextField(
//                 text: "",
//                 keyboardType: TextInputType.text,
//                 controller: ctrl.addressctrl,
//                 hintText: 'Address',
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     ctrl.saveData();
//                     Get.to(() => DisplayScreen());
//                     Get.snackbar('Info', 'Profile has been saved');
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }