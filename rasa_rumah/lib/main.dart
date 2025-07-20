import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rasa_rumah/pages/all_recipes_page.dart';
import 'package:rasa_rumah/pages/category_recipes_page.dart';
import 'package:rasa_rumah/pages/drawer_menu.dart';

import 'package:rasa_rumah/pages/kategori_resep_screen.dart';
import 'package:rasa_rumah/pages/rating_aplikasi_page.dart';

import 'package:rasa_rumah/pages/resep_favorit_page.dart';
import 'package:rasa_rumah/pages/splash_screen.dart';
import 'package:rasa_rumah/pages/tentang_aplikasi_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasa Rumah',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[700],
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: Color(0xFFFDF1E7),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => MyHomePage(
          initialIndex: ModalRoute.of(context)?.settings.arguments as int? ?? 0,
        ),
        '/rating': (context) => RatingPage(),
        '/tentang': (context) => TentangAplikasiPage(),
        '/kategori-resep': (context) => KategoriResepScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int initialIndex;
  const MyHomePage({super.key, this.initialIndex = 0});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    AllRecipesPage(),
    const CategoryRecipesPage(),
    const FavoriteRecipesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rasa Rumah')),
      drawer: DrawerMenu(),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Semua Resep',
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
