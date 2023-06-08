import 'package:app/models/meal.dart';
import 'package:app/screens/categories.dart';
import 'package:app/screens/filters_screen.dart';
import 'package:app/screens/meals.dart';
import 'package:app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;
  final List<Meal> _favortitesMeal = [];
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
      return;
    }
  }

  void _showInfoMessage(String message, Meal meal) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: "undo",
          onPressed: () => _toggleMealFavoriteStatus(meal),
        ),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favortitesMeal.contains(meal);
    setState(() {
      if (isExisting) {
        _favortitesMeal.remove(meal);
        _showInfoMessage("Remove from favorites ${meal.title}", meal);
        return;
      }
      _favortitesMeal.add(meal);
      _showInfoMessage("Add to favorites ${meal.title}", meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
    );
    String activePageTitle = "Categories";
    if (_selectPageIndex == 1) {
      activePageTitle = "Favorites";
      activePage = MealsScreen(
        meals: _favortitesMeal,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "categories...",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "favorites...",
          ),
        ],
      ),
    );
  }
}
