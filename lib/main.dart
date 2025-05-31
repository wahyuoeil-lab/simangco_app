// main.dart
import 'package:flutter/material.dart';
import 'screens/donation_screen.dart';
import 'screens/project_screen.dart';
import 'screens/education_screen.dart';
import 'screens/account_screen.dart';

void main() {
  runApp(BlueRootsApp());
}

class BlueRootsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlueRoots',
      theme: ThemeData(
        primaryColor: Color(0xFF2A9D8F),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DonationScreen(),
    ProjectScreen(),
    EducationScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF2A9D8F),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'Donasi'),
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Proyek'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Edukasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("Selamat Datang 🌊", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatCard(label: "Mangrove", value: "320"),
              StatCard(label: "Terumbu Karang", value: "120"),
            ],
          ),
          SizedBox(height: 20),
          BannerCard(
            title: "Dukung Proyek Restorasi",
            subtitle: "di HKM Seberang Bersatu",
            imageUrl: "https://example.com/mangrove.jpg",
          ),
          SizedBox(height: 20),
          Text("Mengapa Mangrove Penting?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 10),
          Text("Mangrove membantu melindungi garis pantai, menyerap karbon, dan menjadi habitat penting bagi berbagai spesies laut.", textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2A9D8F).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2A9D8F))),
          SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  BannerCard({required this.title, required this.subtitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(0.3),
        ),
        padding: EdgeInsets.all(16),
        alignment: Alignment.bottomLeft,
        child: Text(
          "$title\n$subtitle",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}