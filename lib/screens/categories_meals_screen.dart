import 'package:flutter/material.dart';
import 'package:foods_app/dummy-data.dart';
import 'package:foods_app/models/category.dart';
import 'package:foods_app/widgets/meal_item.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  /* final String categoriesId;
  final String categoriesTitle;

  CategoriesMealScreen(this.categoriesId, this.categoriesTitle);
 */

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoriesTitle = routeArgs['title'];
    final categoriesId = routeArgs['id'];
    final categoriesMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoriesId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoriesTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoriesMeals[index].id,
                title: categoriesMeals[index].title,
                imageUrl: categoriesMeals[index].imageUrl,
                duration: categoriesMeals[index].duration,
                complexity: categoriesMeals[index].complexity,
                affordability: categoriesMeals[index].affordability);
          },
          itemCount: categoriesMeals.length,
        ));
  }
}
