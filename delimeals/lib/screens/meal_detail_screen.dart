import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = '/meal-detail';
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
        child: Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    ));
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  Widget buildIngredientsList(BuildContext context, Meal mealDetail) {
    return ListView.builder(
        itemBuilder: (ctx, index) => Card(
            elevation: 4,
            color: Theme.of(context).accentColor,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(mealDetail.ingredients[index]))),
        itemCount: mealDetail.ingredients.length);
  }

  Widget buildSteps(BuildContext context, Meal mealDetail) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${(index + 1)}'),
            ),
            title: Text(mealDetail.steps[index]),
          ),
          Divider()
        ],
      ),
      itemCount: mealDetail.steps.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final mealTitle = routeArgs['title'];
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    print(mealDetails.title);
    return Scaffold(
        appBar: AppBar(title: Text(mealTitle)),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  mealDetails.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(buildIngredientsList(context, mealDetails)),
            buildSectionTitle(context, "Steps"),
            buildContainer(buildSteps(context, mealDetails))
          ],
        )));
  }
}
