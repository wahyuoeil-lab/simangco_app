import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Halaman Home muncul dengan benar', (WidgetTester tester) async {
    // Memuat aplikasi
    await tester.pumpWidget(BlueRootsApp());

    // Periksa apakah teks "Selamat Datang 🌊" muncul
    expect(find.text('Selamat Datang 🌊'), findsOneWidget);

    // Periksa apakah statistik "Mangrove" dan "Terumbu Karang" ditampilkan
    expect(find.text('Mangrove'), findsOneWidget);
    expect(find.text('Terumbu Karang'), findsOneWidget);

    // Periksa apakah ada ikon navigasi bawah
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.volunteer_activism), findsOneWidget);
    expect(find.byIcon(Icons.eco), findsOneWidget);
    expect(find.byIcon(Icons.menu_book), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('Navigasi ke halaman Donasi', (WidgetTester tester) async {
    await tester.pumpWidget(BlueRootsApp());

    // Tap icon Donasi
    await tester.tap(find.byIcon(Icons.volunteer_activism));
    await tester.pumpAndSettle();

    // Periksa apakah teks "Dukung Konservasi" muncul
    expect(find.text('Dukung Konservasi'), findsOneWidget);
  });

  testWidgets('Navigasi ke halaman Proyek', (WidgetTester tester) async {
    await tester.pumpWidget(BlueRootsApp());

    await tester.tap(find.byIcon(Icons.eco));
    await tester.pumpAndSettle();

    expect(find.text('Proyek Aktif'), findsOneWidget);
  });

  testWidgets('Navigasi ke halaman Edukasi dan Akun', (WidgetTester tester) async {
    await tester.pumpWidget(BlueRootsApp());

    await tester.tap(find.byIcon(Icons.menu_book));
    await tester.pumpAndSettle();
    expect(find.text('Edukasi'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.text('Akun'), findsOneWidget);
  });
}