import 'package:flutter/material.dart';
import 'package:movie_browser/features/presentation/pages/favorite_page.dart';
import 'package:movie_browser/features/presentation/pages/movie_page.dart';
import 'package:movie_browser/features/presentation/theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pageList = [const MoviePage(), const FavoritePage()];
  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text(movieBrowser, style: TextStyle(color: cyanColor)),
        ),
        body: _pageList.elementAt(_currentIndex),

        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.tealAccent,
          unselectedItemColor: Colors.white,
          backgroundColor: backgroundColor,
          currentIndex: _currentIndex,
          onTap: _changePage,
          items: const [
            BottomNavigationBarItem(
              label: 'Movie',
              icon: Icon(Icons.movie_filter_outlined),
            ),
            BottomNavigationBarItem(
              label: favorites,
              icon: Icon(Icons.star_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
