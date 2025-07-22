import 'package:flutter/material.dart';
import 'package:rasa_rumah/theme/app_theme.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppTheme.backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppTheme.primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 60, height: 60),
                  const SizedBox(height: 8),
                  const Text(
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
              leading: const Icon(Icons.menu_book),
              title: const Text('Semua Resep'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home', arguments: 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Kategori Resep'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/kategori-resep');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Resep Favorit'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home', arguments: 2); // Corrected index
              },
            ),
            const Divider(thickness: 1),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Rating Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/rating');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
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
