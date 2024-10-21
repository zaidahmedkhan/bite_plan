import 'package:bite_plan/data/dummy_data.dart';
import 'package:bite_plan/models/category.dart';
import 'package:bite_plan/models/meal.dart';
import 'package:bite_plan/screens/meals.dart';
import 'package:bite_plan/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.availabaleMeals});

  final List<Meal> availabaleMeals;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = availabaleMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: filteredMeals,
                )));
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
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
