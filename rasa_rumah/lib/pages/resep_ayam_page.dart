import 'package:flutter/material.dart';

class ResepAyamPage extends StatelessWidget {
  const ResepAyamPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resep Ayam')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Gambar Makanan
            Center(
              child: Image.asset(
                'assets/ayam_cabe_kacang_mete.jpg', // pastikan gambar ini ada di folder assets
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Ayam Cabe Kacang Mete',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'BAHAN:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '''• 2 daging dada ayam
• Minyak untuk menggoreng secukupnya
• 3 siung bawang putih, memarkan
• 1 buah bawang bombay, iris
• 2 cm jahe memarkan
• 1 sdm saus tiram
• 5 sdm kecap manis
• 1 sdt garam dan 1/2 sdt merica bubuk
• 100 ml air
• 1 sdm tepung maizena larutkan dengan sedikit air''',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 24),

            // Icon Love di pojok kanan bawah
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () { /* TODO: Implement favorite functionality */ },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
