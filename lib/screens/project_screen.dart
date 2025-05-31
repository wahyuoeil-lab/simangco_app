// TODO Implement this library.
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Restorasi Mangrove 2025',
      'location': 'HKM Seberang Bersatu',
      'image': 'https://example.com/restorasi1.jpg'
    },
    {
      'title': 'Penanaman Terumbu Karang',
      'location': 'Perairan Belitung',
      'image': 'https://example.com/karang1.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proyek Aktif"),
        backgroundColor: Color(0xFF2A9D8F),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    project['image']!,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(project['location']!),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}