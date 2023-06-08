import 'package:app/models/meal.dart';
import 'package:app/screens/meal_details.dart';
import 'package:app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    this.title,
    required this.meals,
    required this.onToggleFavorite,
    super.key,
  });
  final void Function(Meal meal) onToggleFavorite;
  final String? title;
  final List<Meal> meals;
  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealDetailsScreen(
                meal: meal,
                onToggleFavorite: onToggleFavorite,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No meals to be displayed :(",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      body = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) {
          return MealItem(
            meal: meals[index],
            onSelectMeal: () {
              return _selectMeal(context, meals[index]);
            },
          );
        }),
      );
    }
    if (title == null) {
      return body;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
      body: body,
    );
  }
}
