import 'package:flutter/material.dart';
import 'package:rasa_rumah/pages/all_recipes_page.dart';
import 'package:rasa_rumah/pages/themed_recipes_page.dart';
import 'package:rasa_rumah/pages/category_recipes_page.dart';
import 'package:rasa_rumah/pages/favorite_recipes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasa Rumah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AllRecipesPage(),
    ThemedRecipesPage(),
    CategoryRecipesPage(),
    FavoriteRecipesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rasa Rumah'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Semua Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style),
            label: 'Resep Tematik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Resep Favorit',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}