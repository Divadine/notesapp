import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarLeading extends StatelessWidget {
 final  IconData icon;
 final VoidCallback? onTap;
  const AppbarLeading({super.key, required this.icon,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,

            ),
            boxShadow: [
            ]
          ),
          child: Icon(icon),

        ),
      ),
    );
  }
}
