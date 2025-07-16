import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Tambahkan ini di pubspec.yaml

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});
  final String playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.example.yourapp'; // Ganti dengan link Play Store asli

  Future<void> _launchURL() async {
    if (await canLaunchUrl(Uri.parse(playStoreUrl))) {
      await launchUrl(Uri.parse(playStoreUrl));
    } else {
      throw 'Could not launch $playStoreUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating Aplikasi"),
        leading: BackButton(),
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
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _launchURL,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: Text("Rate di Play Store"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
