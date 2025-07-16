import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFDF1E7),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange[700]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 60, height: 60),
                  SizedBox(height: 8),
                  Text(
                    'Rasa Rumah',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Semua Resep'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home', arguments: 0);
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Kategori Resep'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/kategori-resep');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Resep Favorit'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home', arguments: 3);
              },
            ),
            Divider(thickness: 1),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rating Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/rating');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/tentang');
              },
            ),
          ],
        ),
      ),
    );
  }
}
