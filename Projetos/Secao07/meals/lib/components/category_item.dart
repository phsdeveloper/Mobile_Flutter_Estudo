import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category,{super.key});


  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Text(category.title),);
  }
}