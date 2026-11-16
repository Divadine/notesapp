import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const BottomNavBar({super.key, required this.icon, required this.label, required this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selected ? Colors.greenAccent : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: Duration(milliseconds: 200),
              child: Icon(icon,color: selected ? Colors.black : Colors.grey,),
            ),
            Text(label,style: TextStyle( fontWeight: selected ? FontWeight.w600 : FontWeight.w400,color: selected ? Colors.black : Colors.grey,),)
          ],
        ),
      ),
    );
  }
}
