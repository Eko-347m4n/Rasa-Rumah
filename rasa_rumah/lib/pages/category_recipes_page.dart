import 'package:flutter/material.dart';
import 'package:rasa_rumah/pages/themed_recipes_page.dart';

class CategoryRecipesPage extends StatelessWidget {
  const CategoryRecipesPage({super.key});

  final List<String> _categories = const [
    'ayam',
    'ikan',
    'kambing',
    'sapi',
    'tahu',
    'telur',
    'tempe',
    'udang',
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThemedRecipesPage(category: category),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
