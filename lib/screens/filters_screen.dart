import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorscheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              "Gluten-free",
              style: textTheme.titleLarge!.copyWith(
                color: colorscheme.onBackground,
              ),
            ),
            subtitle: Text(
              "Only include gluten-free meals.",
              style: textTheme.titleSmall!.copyWith(
                color: colorscheme.onBackground,
              ),
            ),
            activeColor: colorscheme.tertiary,
            contentPadding: EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          ),
        ],
      ),
    );
  }
}
