import 'package:flutter/material.dart';

class KategoriResepScreen extends StatelessWidget {
  const KategoriResepScreen({super.key});
  final List<Map<String, String>> kategori = const [
    {"nama": "Ayam", "gambar": "assets/kategori/ayam.jpg"},
    {"nama": "Daging", "gambar": "assets/kategori/daging.jpg"},
    {"nama": "Bebek", "gambar": "assets/kategori/bebek.jpg"},
    {"nama": "Cumi", "gambar": "assets/kategori/cumi.jpg"},
    {"nama": "Ikan", "gambar": "assets/kategori/ikan.jpg"},
    {"nama": "Jamur", "gambar": "assets/kategori/jamur.jpg"},
    {"nama": "Buah", "gambar": "assets/kategori/buah.jpg"},
    {"nama": "Sayur", "gambar": "assets/kategori/sayur.jpg"},
    {"nama": "Sambal", "gambar": "assets/kategori/sambal.jpg"},
    {"nama": "Mie", "gambar": "assets/kategori/mie.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori Resep"),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: kategori.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // dua kolom
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke daftar resep berdasarkan kategori
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            kategori[index]["gambar"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          kategori[index]["nama"]!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
