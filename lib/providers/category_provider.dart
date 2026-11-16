
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/models/category_model.dart';

class CategoryProvider extends Notifier<List<CategoryModel>>{

  @override
  List<CategoryModel> build(){
    return [
      CategoryModel(
          title: 'personal',
          icon: Icons.person,
          bgColor:Colors.blueGrey
      ),
      CategoryModel(
          title: 'Work',
          icon: Icons.work,
          bgColor:CupertinoColors.systemYellow

      ),
      CategoryModel(
          title: 'Travel',
          icon: Icons.mode_of_travel,
          bgColor:Colors.greenAccent

      ),
      CategoryModel(
          title: "Health",
          icon: CupertinoIcons.heart,
          bgColor:Colors.brown

      ),
    ];
  }

  void addCategory(CategoryModel c) => state = [...state, c];
}

final categoryProvider = NotifierProvider<CategoryProvider, List<CategoryModel>>(CategoryProvider.new);