import 'package:flutter/material.dart';

class TentangAplikasiPage extends StatelessWidget {
  const TentangAplikasiPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Aplikasi
            Image.asset(
              'assets/logo_rasa_rumah.png', // Ganti dengan nama file gambar logomu
              width: 100,
              height: 100,
            ),
            SizedBox(height: 24),

            // Deskripsi Aplikasi
            Text(
              'Rasa Rumah adalah aplikasi resep harian\n'
              'yang membantu Anda menemukan inspirasi\n'
              'masakan rumahan sehat setiap minggu.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),

            // Informasi Pengembang
            Text(
              'Dikembangkan oleh: Ninis Dkk.\n'
              'Email: support@rasarumah.com\n'
              'Versi: 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
