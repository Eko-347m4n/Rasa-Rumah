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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return Card(
          child: ListTile(
            title: Text(
              category[0].toUpperCase() + category.substring(1),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
