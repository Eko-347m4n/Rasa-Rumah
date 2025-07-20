import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rasa_rumah/widgets/recipe_card.dart';
import 'package:rasa_rumah/widgets/download_recipe_dialog.dart';

class FavoriteRecipesPage extends StatefulWidget {
  const FavoriteRecipesPage({super.key});

  @override
  State<FavoriteRecipesPage> createState() => _FavoriteRecipesPageState();
}

class _FavoriteRecipesPageState extends State<FavoriteRecipesPage> {
  List<Map<String, dynamic>> _favoriteRecipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoriteRecipes();
  }

  Future<void> _loadFavoriteRecipes() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('favorites') // Assuming a 'favorites' collection
          .get();
      setState(() {
        _favoriteRecipes = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      // TODO: Log error to a logging framework
      setState(() {
        _isLoading = false;
      });
    }
  }

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
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _favoriteRecipes.isEmpty
            ? const Center(child: Text('Tidak ada resep favorit.'))
            : ListView.builder(
                itemCount: _favoriteRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = _favoriteRecipes[index];
                  return GestureDetector(
                    onTap: () => _showDownloadDialog(context, recipe['judul']!),
                    child: RecipeCard(
                      recipe: recipe,
                    ),
                  );
                },
              );
  }
}
