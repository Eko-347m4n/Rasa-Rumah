import 'package:flutter/material.dart';
import 'package:rasa_rumah/widgets/recipe_card.dart';
import 'package:rasa_rumah/widgets/download_recipe_dialog.dart';

class FavoriteRecipesPage extends StatelessWidget {
  const FavoriteRecipesPage({super.key});

  final List<Map<String, String>> _favoriteRecipes = const [
    {
      'title': 'Soto Ayam',
      'description': 'Soto ayam kuah kuning yang segar.',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Soto_Ayam_Lamongan.jpg/1200px-Soto_Ayam_Lamongan.jpg',
    },
    {
      'title': 'Martabak Manis',
      'description': 'Martabak manis dengan topping cokelat keju.',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Martabak_Manis.jpg/1200px-Martabak_Manis.jpg',
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
      itemCount: _favoriteRecipes.length,
      itemBuilder: (context, index) {
        final recipe = _favoriteRecipes[index];
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