import 'dart:io';
import 'package:creater_project/views/dataentry/data_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_ctrl.dart';

class DisplayScreen extends StatelessWidget {
  DisplayScreen({super.key});
  final UserCtrl ctrl = Get.find();

  Widget buildInfoContainer(String label, String value, Color bgColor, IconData icon) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Your Data'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                backgroundImage: ctrl.imagePath.value.isNotEmpty ? FileImage(File(ctrl.imagePath.value)) : null,
                child: ctrl.imagePath.value.isEmpty? Icon(Icons.person, size: 50, color: Colors.blue.shade700) : null,
              ),
              const SizedBox(height: 24),
              buildInfoContainer('Name', ctrl.name.value, Colors.blue.shade50, Icons.person),
              buildInfoContainer('Age', ctrl.age.value, Colors.green.shade50, Icons.cake),
              buildInfoContainer('Email', ctrl.email.value, Colors.orange.shade50, Icons.email),
              buildInfoContainer('Phone', ctrl.phone.value, Colors.purple.shade50, Icons.phone),
              buildInfoContainer('Address', ctrl.address.value, Colors.yellow.shade50, Icons.location_on),
              const SizedBox(height: 20),
              SizedBox(  
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => DataEntryScreen());
                    Get.snackbar('Info', 'Now you can edit your info');
                  },
                  child: const Text('Edit'),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}