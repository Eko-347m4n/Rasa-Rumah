
import 'package:flutter/material.dart';

class DownloadRecipeDialog extends StatelessWidget {
  final String recipeTitle;

  const DownloadRecipeDialog({
    super.key,
    required this.recipeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Download Resep $recipeTitle'),
      content: const Text('Apakah Anda ingin mengunduh resep ini?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement actual download logic here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mengunduh resep $recipeTitle...')),
            );
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Unduh'),
        ),
      ],
    );
  }
}
