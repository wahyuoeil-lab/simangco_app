import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edukasi"),
        backgroundColor: Color(0xFF2A9D8F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pelajari Pentingnya Mangrove dan Terumbu Karang",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "Mangrove dan terumbu karang merupakan ekosistem penting yang membantu mencegah abrasi pantai, menjadi rumah bagi banyak biota laut, dan menyerap karbon dioksida dari atmosfer.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text("Video Edukasi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(child: Icon(Icons.play_circle_fill, size: 64, color: Colors.grey[700])),
            ),
          ],
        ),
      ),
    );
  }
}
