import 'dart:io';
import 'package:creater_project/views/dataentry/data_detail.dart';
import 'package:creater_project/controllers/user_ctrl.dart';
import 'package:creater_project/views/dataentry/data_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListScreen extends StatelessWidget {
  ListScreen({super.key});
  final UserCtrl ctrl = Get.put(UserCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Entries')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => DataEntryScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() => ListView.builder(
        itemCount: ctrl.entries.length,
        itemBuilder: (context, index) {
          final entry = ctrl.entries[index]; // ek Map (packet) nikala

          return ListTile(
            leading: entry['imagePath'] != ''
                ? CircleAvatar(backgroundImage: FileImage(File(entry['imagePath'])))
                : const CircleAvatar(child: Icon(Icons.person)),
            title: Text(entry['name']),
            subtitle: Text(entry['email']),
            onTap: () {
              // click karne pe isi entry ki poori detail agli screen pe bhejo
              Get.to(() => EntryDetailScreen(entry: entry));
            },
          );
        },
      )),
    );
  }
}