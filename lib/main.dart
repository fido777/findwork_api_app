import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:findwork_api_app/model/local_job.dart';
import 'package:findwork_api_app/pages/favorites_page.dart';
import 'package:findwork_api_app/pages/findwork_api_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalJobAdapter());
  await Hive.openBox<LocalJob>('local_jobs');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Findwork Jobs',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FindworkApiPage(title: 'Trabajos de Findwork'),
    const FavoritesPage(title: 'Ofertas de trabajo favoritas'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 
            ? const Icon(Icons.work)
            : const Icon(Icons.work_outline),
            label: 'Trabajos',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

