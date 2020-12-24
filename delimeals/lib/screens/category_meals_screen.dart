import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: Center(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              Meal meal = categoryMeals[index];
              return MealItem(
                title: meal.title,
                imageUrl: meal.imageUrl,
                complexity: meal.complexity,
                affordability: meal.affordability,
                duration: meal.duration,
              );
            },
            itemCount: categoryMeals.length,
          ),
        ));
  }
}
