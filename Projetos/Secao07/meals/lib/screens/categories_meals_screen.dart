import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.category,{super.key});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Receitas por Categoria ${category.id}'),
      ),
    );
  }
}