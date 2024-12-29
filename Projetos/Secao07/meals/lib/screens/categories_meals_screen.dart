import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../data/dummy_data.dart';
import '../components/meal_item.dart';

import '../models/meal.dart';
class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.meals,{super.key});
  final List<Meal> meals;


  @override
  Widget build(BuildContext context) {
      final Category category = ModalRoute.of(context)!.settings.arguments as Category;
      final categoryMeals = meals.where((meal){
        return meal.categories.contains(category.id);
      }).toList();
    return  Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index){
            return MealItem(categoryMeals[index]);
          },
        ),
      ),
    );
  }
}