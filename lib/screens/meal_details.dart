import 'package:app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: NetworkImage(meal.imageUrl),
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,
      ),
    );
  }
}
