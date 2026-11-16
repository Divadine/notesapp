import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/category_model.dart';

class CategoryContainer extends StatefulWidget {
  final VoidCallback?  onAddTap;
  const CategoryContainer({super.key, this.onAddTap, });

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {

  List<CategoryModel> categories = [
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 120,
      child: ListView.separated(
        itemCount: categories.length + 1,
        scrollDirection: Axis.horizontal,

        separatorBuilder:  (_, __) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            if (index == categories.length) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: widget.onAddTap,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red),
                      ),

                      child: Icon(Icons.add),
                    ),
                  )
                ],
              );
            };


            final category = categories[index];
            return Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: category.bgColor,
                      border: Border.all(color: Colors.red),
                    ),
                    child: Icon(category.icon, color: Colors.white,),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  ),
                ]
            );
          }
      ),
      );

  }
}
