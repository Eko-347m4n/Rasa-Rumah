import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rasa_rumah/widgets/recipe_card.dart';
import 'package:rasa_rumah/widgets/download_recipe_dialog.dart';

class AllRecipesPage extends StatefulWidget {
  const AllRecipesPage({super.key});

  @override
  AllRecipesPageState createState() => AllRecipesPageState();
}

class AllRecipesPageState extends State<AllRecipesPage> {
  List<Map<String, dynamic>> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('resep')
          .get();
      setState(() {
        _recipes = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
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
        : _recipes.isEmpty
        ? const Center(child: Text('Tidak ada resep yang ditemukan.'))
        : DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.list), text: 'List View'),
                    Tab(icon: Icon(Icons.grid_on), text: 'Grid View'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // List View
                      ListView.builder(
                        itemCount: _recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = _recipes[index];
                          return GestureDetector(
                            onTap: () =>
                                _showDownloadDialog(context, recipe['judul']!),
                            child: RecipeCard(recipe: recipe),
                          );
                        },
                      ),
                      // Grid View
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 0.7, // Adjust as needed
                            ),
                        itemCount: _recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = _recipes[index];
                          return GestureDetector(
                            onTap: () =>
                                _showDownloadDialog(context, recipe['judul']!),
                            child: RecipeCard(recipe: recipe),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
