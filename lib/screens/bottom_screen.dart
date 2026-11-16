import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/bottom_nav_bar.dart';

class BottomScreen extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  const BottomScreen({super.key, required this.index, required this.onTap});

  static const List<(IconData, String)> items = [
    (Icons.notes, 'Notes'),
    (Icons.star_border, 'Favorite'),
    (Icons.check_circle_outline, 'To-dos'),
    (Icons.settings_outlined, 'Settings'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for(int i = 0; i < items.length; i++)
              BottomNavBar(
                icon: items[i].$1,
                label:  items[i].$2,
                selected: i == index,
                onTap: () => onTap(i),
              )
          ],
        
        ),
      ),
    );
  }
}
