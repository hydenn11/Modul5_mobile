import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 5 - SafeArea & PageView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Berpindah ke page yang dipilih saat icon ditekan
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          // Update status bottom bar saat layar digeser
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // PAGE 1
          const Center(child: Text('Page 1', style: TextStyle(fontSize: 16))),

          // PAGE 2 (Uji SafeArea)
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      '103022300147_Luthfi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Page 2', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // PAGE 3
          const Center(child: Text('Page 3', style: TextStyle(fontSize: 16))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Page 1'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Page 2'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Page 3'),
        ],
      ),
    );
  }
}
