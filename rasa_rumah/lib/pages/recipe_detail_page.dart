import 'package:flutter/material.dart';
import 'package:rasa_rumah/widgets/download_recipe_dialog.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailPage({super.key, required this.recipe});

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
    final String title = recipe['judul'] as String? ?? 'No Title';
    final String imageUrl = recipe['gambar'] as String? ?? '';
    final List<dynamic> ingredients = recipe['bahan'] as List<dynamic>? ?? [];
    final List<dynamic> steps = recipe['langkah'] as List<dynamic>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _showDownloadDialog(context, title),
            tooltip: 'Download Resep',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.image_not_supported,
                            size: 100, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
            const SizedBox(height: 24),
            Text(
              'Bahan-bahan',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            for (var ingredient in ingredients)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0, left: 8.0),
                child: Text(
                  '• ${ingredient as String? ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            const SizedBox(height: 24),
            Text(
              'Langkah-langkah',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            for (int i = 0; i < steps.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${i + 1}. ', style: Theme.of(context).textTheme.bodyMedium),
                    Expanded(
                      child: Text(
                        steps[i] as String? ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
