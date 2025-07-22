import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Moved the launch logic to a top-level function
Future<void> _launchURL(BuildContext context) async {
  final Uri url = Uri.parse('https://play.google.com/store/apps/details?id=com.example.yourapp');
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    // Show a snackbar or dialog on failure
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch ${url.toString()}'),
        ),
      );
    }
  }
}

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rating Aplikasi"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kami menghargai ulasan Anda!\nBeri rating dan ulasan Anda di Play Store",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _launchURL(context), // Call the top-level function
                child: const Text("Rate di Play Store"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}