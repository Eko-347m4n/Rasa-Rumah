import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<String> resepMasakan = const [
    'Ayam Cabe Kacang Mete',
    'Asinan Sayur',
    'Ayam Bakar Bumbu Minang',
    'Ayam Bakar Kecap',
    'Ayam Bakar Bumbu Bali',
    'Ayam Bumbu Kemangi',
    'Ayam bumbu Rempah',
    'Ayam Bungkus Saus Kecap',
    'Ayam Goreng',
    'Ayam Goreng Bumbu Bali',
    'Ayam Kukus Jahe',
    'Ayam Suwir Sambal Matah',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Resep Masakan',
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            /* TODO: Implement drawer opening */
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              /* TODO: Implement search functionality */
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFFDF1E7),
      body: ListView.builder(
        itemCount: resepMasakan.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              tileColor: Color(0xFFFDF1E7),
              leading: Image.asset(
                'assets/logo.png', // logo kecil di setiap item
                width: 40,
                height: 40,
              ),
              title: Text(resepMasakan[index]),
              onTap: () {
                // Bisa arahkan ke halaman detail
              },
            ),
          );
        },
      ),
    );
  }
}
