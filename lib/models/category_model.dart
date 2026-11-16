import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Color bgColor;

  CategoryModel({required this.title, required this.icon, this.iconColor, required this.bgColor});
}
