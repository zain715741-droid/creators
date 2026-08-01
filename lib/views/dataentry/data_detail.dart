import 'dart:io';
import 'package:flutter/material.dart';

class EntryDetailScreen extends StatelessWidget {
  final Map entry;
  const EntryDetailScreen({super.key, required this.entry});

  static const accent = Color(0xFF4F6BFF);

  Widget infoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: accent.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, size: 18, color: accent),
          ),
          const SizedBox(width: 14),
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          const Spacer(),
          Text(value.isEmpty ? '-' : value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = entry['imagePath'] != null && entry['imagePath'] != '';

    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF7),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: accent,
            foregroundColor: Colors.white,
            expandedHeight: 230,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accent, accent.withOpacity(0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: CircleAvatar(
                          radius: 46,
                          backgroundColor: accent.withOpacity(0.1),
                          backgroundImage: hasImage ? FileImage(File(entry['imagePath'])) : null,
                          child: !hasImage ? Icon(Icons.person, size: 42, color: accent) : null,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        (entry['name'] ?? '').isEmpty ? 'No name' : entry['name'],
                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [BoxShadow(color: accent.withOpacity(0.1), blurRadius: 14, offset: const Offset(0, 6))],
                  ),
                  child: Column(
                    children: [
                      infoTile(Icons.cake_outlined, 'Age', entry['age'] ?? ''),
                      Divider(height: 1, color: Colors.grey.shade100, indent: 16, endIndent: 16),
                      infoTile(Icons.email_outlined, 'Email', entry['email'] ?? ''),
                      Divider(height: 1, color: Colors.grey.shade100, indent: 16, endIndent: 16),
                      infoTile(Icons.phone_outlined, 'Phone', entry['phone'] ?? ''),
                      Divider(height: 1, color: Colors.grey.shade100, indent: 16, endIndent: 16),
                      infoTile(Icons.location_on_outlined, 'Address', entry['address'] ?? ''),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}