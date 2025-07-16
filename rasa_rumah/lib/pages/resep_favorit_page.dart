import 'package:flutter/material.dart';

class FavoriteRecipesPage extends StatelessWidget {
  const FavoriteRecipesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Data saat ini belum tersedia",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Fitur Resep Favorit memungkinkan Anda untuk menyimpan resep-resep yang Anda sukai di aplikasi "
                    "dengan mengklik ikon hati di sudut kanan bawah saat membaca resep tersebut.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
