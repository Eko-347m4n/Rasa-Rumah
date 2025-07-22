
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rasa_rumah/pages/recipe_detail_page.dart';
import 'package:rasa_rumah/widgets/recipe_card.dart';

class ThemedRecipesPage extends StatefulWidget {
  final String category;

  const ThemedRecipesPage({super.key, required this.category});

  @override
  ThemedRecipesPageState createState() => ThemedRecipesPageState();
}

class ThemedRecipesPageState extends State<ThemedRecipesPage> {
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
          .where('kategori', isEqualTo: widget.category)
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

  @override
  Widget build(BuildContext context) {
    final String appBarTitle =
        widget.category[0].toUpperCase() + widget.category.substring(1);

    return Scaffold(
      appBar: AppBar(
        title: Text('Resep $appBarTitle'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _recipes.isEmpty
              ? const Center(child: Text('Tidak ada resep untuk kategori ini.'))
              : GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _recipes[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailPage(recipe: recipe),
                          ),
                        );
                      },
                      child: RecipeCard(recipe: recipe),
                    );
                  },
                ),
    );
  }
}
