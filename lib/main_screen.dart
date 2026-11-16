import 'package:flutter/material.dart';
import 'package:notes_app/screens/bottom_screen.dart';
import 'package:notes_app/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List<Widget> pages = [
    NotesApp(),
    Text('Favorite'),
    Text('To-dos'),
    Text('Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: pages,
      ),
      bottomNavigationBar: BottomScreen(
        index: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
