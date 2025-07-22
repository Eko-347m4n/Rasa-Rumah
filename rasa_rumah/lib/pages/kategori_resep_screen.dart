import 'package:flutter/material.dart';
import 'package:rasa_rumah/pages/themed_recipes_page.dart';

class KategoriResepScreen extends StatelessWidget {
  const KategoriResepScreen({super.key});
  final List<Map<String, String>> kategori = const [
    {"nama": "Ayam", "gambar": "assets/kategori/ayam.png"},
    {"nama": "Ikan", "gambar": "assets/kategori/ikan.png"},
    {"nama": "Kambing", "gambar": "assets/kategori/kambing.png"},
    {"nama": "Sapi", "gambar": "assets/kategori/sapi.png"},
    {"nama": "Tahu", "gambar": "assets/kategori/tahu.png"},
    {"nama": "Telur", "gambar": "assets/kategori/telur.png"},
    {"nama": "Tempe", "gambar": "assets/kategori/tempe.png"},
    {"nama": "Tofu", "gambar": "assets/kategori/tofu.png"},
    {"nama": "Udang", "gambar": "assets/kategori/udang.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori Resep"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: kategori.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.95,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThemedRecipesPage(
                        category: kategori[index]["nama"]!.toLowerCase()),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            kategori[index]["gambar"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          kategori[index]["nama"]!,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
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
