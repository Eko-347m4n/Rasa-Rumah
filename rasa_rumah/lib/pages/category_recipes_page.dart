import 'package:flutter/material.dart';

class CategoryRecipesPage extends StatelessWidget {
  const CategoryRecipesPage({super.key});

  final List<String> _categories = const [
    'Masakan Indonesia',
    'Masakan Asia',
    'Masakan Barat',
    'Minuman',
    'Kue & Roti',
    'Makanan Penutup',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(category, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Implement navigation to a page showing recipes for this category
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda memilih kategori: $category')),
              );
            },
          ),
        );
      },
    );
  }
}