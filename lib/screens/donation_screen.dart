// donation_screen.dart
import 'package:flutter/material.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String _selectedType = 'Mangrove';
  int _selectedAmount = 25000;
  String _selectedMethod = 'QRIS';
  final TextEditingController _customAmountController = TextEditingController();

  void _donate() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Donasi Berhasil!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.verified, color: Colors.green, size: 48),
            SizedBox(height: 10),
            Text('Sertifikat digital dan lokasi adopsi berhasil dibuat.'),
            SizedBox(height: 10),
            Image.asset('assets/images/map_sample.png', height: 100),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tutup'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donasi')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Pilih Jenis Donasi', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Mangrove', 'Terumbu Karang'].map((type) => ChoiceChip(
                label: Text(type),
                selected: _selectedType == type,
                onSelected: (_) => setState(() => _selectedType = type),
              )).toList(),
            ),
            SizedBox(height: 20),

            Text('Jumlah Donasi', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: [25000, 50000, 100000].map((amount) => ChoiceChip(
                label: Text('Rp$amount'),
                selected: _selectedAmount == amount,
                onSelected: (_) => setState(() {
                  _selectedAmount = amount;
                  _customAmountController.clear();
                }),
              )).toList(),
            ),
            TextField(
              controller: _customAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah Custom (Rp)'),
              onChanged: (val) => setState(() {
                if (val.isNotEmpty) _selectedAmount = int.tryParse(val) ?? _selectedAmount;
              }),
            ),
            SizedBox(height: 20),

            Text('Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedMethod,
              items: ['QRIS', 'E-Wallet', 'Transfer Bank'].map((method) => DropdownMenuItem(
                value: method,
                child: Text(method),
              )).toList(),
              onChanged: (value) => setState(() => _selectedMethod = value!),
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: _donate,
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2A9D8F)),
              child: Text('Lanjut Donasi'),
            ),
          ],
        ),
      ),
    );
  }
}