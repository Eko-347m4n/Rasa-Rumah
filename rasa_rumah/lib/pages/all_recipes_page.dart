
import 'package:flutter/material.dart';
import 'package:rasa_rumah/widgets/recipe_card.dart';
import 'package:rasa_rumah/widgets/download_recipe_dialog.dart';

class AllRecipesPage extends StatelessWidget {
  const AllRecipesPage({super.key});

  final List<Map<String, String>> _recipes = const [
    {
      'title': 'Nasi Goreng',
      'description': 'Nasi goreng spesial dengan telur dan ayam.',
      'imageUrl': 'https://www.sasa.co.id/medias/page_medias/nasi_goreng_sosis_spesial.jpeg',
    },
    {
      'title': 'Sate Ayam',
      'description': 'Sate ayam dengan bumbu kacang yang lezat.',
      'imageUrl': 'https://www.sasa.co.id/medias/page_medias/sate_ayam_bumbu_kacang.jpeg',
    },
    {
      'title': 'Gado-Gado',
      'description': 'Salad sayuran khas Indonesia dengan saus kacang.',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Gado-gado_betawi.jpg',
    },
    {
      'title': 'Rendang',
      'description': 'Daging sapi yang dimasak perlahan dengan santan dan rempah-rempah.',
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Rendang.jpg/1200px-Rendang.jpg',
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
    return DefaultTabController(
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
                      onTap: () => _showDownloadDialog(context, recipe['title']!),
                      child: RecipeCard(
                        title: recipe['title']!,
                        description: recipe['description']!,
                        imageUrl: recipe['imageUrl']!,
                      ),
                    );
                  },
                ),
                // Grid View
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.7, // Adjust as needed
                  ),
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _recipes[index];
                    return GestureDetector(
                      onTap: () => _showDownloadDialog(context, recipe['title']!),
                      child: RecipeCard(
                        title: recipe['title']!,
                        description: recipe['description']!,
                        imageUrl: recipe['imageUrl']!,
                      ),
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
