import 'package:flutter/material.dart';
import 'package:rasa_rumah/widgets/recipe_card.dart';
import 'package:rasa_rumah/widgets/download_recipe_dialog.dart';

class ThemedRecipesPage extends StatelessWidget {
  const ThemedRecipesPage({super.key});

  final List<Map<String, String>> _themedRecipes = const [
    {
      'title': 'Resep Lebaran: Opor Ayam',
      'description': 'Opor ayam klasik untuk hidangan Lebaran.',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Opor_Ayam.jpg/1200px-Opor_Ayam.jpg',
    },
    {
      'title': 'Resep Natal: Kue Kering Jahe',
      'description': 'Kue kering jahe yang renyah dan harum untuk Natal.',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Gingerbread_cookies.jpg/1200px-Gingerbread_cookies.jpg',
    },
    {
      'title': 'Resep Musim Hujan: Bakso Hangat',
      'description': 'Bakso kuah hangat yang cocok dinikmati saat hujan.',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Bakso_sapi.jpg/1200px-Bakso_sapi.jpg',
    },
  ];

  void _showDownloadDialog(BuildContext context, String recipeTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DownloadRecipeDialog(recipeTitle: recipeTitle);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _themedRecipes.length,
      itemBuilder: (context, index) {
        final recipe = _themedRecipes[index];
        return GestureDetector(
          onTap: () => _showDownloadDialog(context, recipe['title']!),
          child: RecipeCard(
            title: recipe['title']!,
            description: recipe['description']!,
            imageUrl: recipe['imageUrl']!,
          ),
        );
      },
    );
  }
}