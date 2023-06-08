import 'package:app/data/dummy_data.dart';
import 'package:app/models/category.dart';
import 'package:app/models/meal.dart';
import 'package:app/screens/meals.dart';
import 'package:app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> meals = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: meals,
            onToggleFavorite: onToggleFavorite,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(category, () {
            _selectCategory(context, category);
          })
      ],
    );
  }
}
