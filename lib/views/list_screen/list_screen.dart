// ignore_for_file: duplicate_ignore, deprecated_member_use

import 'dart:io';
import 'package:creater_project/views/dataentry/data_detail.dart';
import 'package:creater_project/controllers/user_ctrl.dart';
import 'package:creater_project/views/dataentry/data_entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});
  final UserCtrl ctrl = Get.put(UserCtrl());

  static const accent = Color(0xFF4F6BFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF7),
      appBar: AppBar(
        title: const Text('Entries', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: accent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),



      floatingActionButton: FloatingActionButton(
        backgroundColor: accent,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: () => Get.to(() => DataEntryScreen()),
        child: const Icon(Icons.add, color: Colors.white),
      ),



      body: Column(
        children: [
          // SEARCH BOX
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  // ignore: deprecated_member_use
                  BoxShadow(color: accent.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: TextField(
                onChanged: (value) => ctrl.searchText.value = value,
                decoration: InputDecoration(
                  hintText: 'Search by name...',
                  prefixIcon: Icon(Icons.search, color: accent),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          // LIST
          Expanded(
            child: Obx(() {
              final list = ctrl.filteredEntries;

              if (list.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people_outline, size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 12),
                      Text(
                        ctrl.searchText.value.isEmpty ? 'No entries yet' : 'No entries found',
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: list.length,
                separatorBuilder: (_, _) => const SizedBox(height: 18),
                itemBuilder: (context, index) {
                  final entry = list[index];
                  final hasImage = entry['imagePath'] != null && entry['imagePath'] != '';

                  return Dismissible(
                    key: Key((entry['name'] ?? '') + index.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 24),
                      child: const Icon(Icons.delete, color: Colors.white, size: 28),
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Entry'),
                          content: const Text('Kya tum is entry ko delete karna chahte ho?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (direction) {
                      ctrl.deleteEntry(ctrl.entries.indexOf(entry));
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // PEECHE WALA CARD (stacked effect)
                        Positioned(
                          top: 8,
                          left: 14,
                          right: 14,
                          child: Container(
                            height: 78,
                            decoration: BoxDecoration(
                              color: accent.withOpacity(0.35),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        // AAGE WALA ASLI CARD
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: accent.withOpacity(0.15),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(18),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(18),
                              onTap: () => Get.to(() => EntryDetailScreen(entry: entry)),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: accent, width: 2),
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        radius: 26,
                                        backgroundColor: accent.withOpacity(0.1),
                                        backgroundImage: hasImage ? FileImage(File(entry['imagePath'])) : null,
                                        child: !hasImage ? Icon(Icons.person, color: accent) : null,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            (entry['name'] ?? '').isEmpty ? 'No name' : entry['name'],
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            entry['email'] ?? '',
                                            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(color: accent.withOpacity(0.1), shape: BoxShape.circle),
                                      child: Icon(Icons.chevron_right, color: accent, size: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}