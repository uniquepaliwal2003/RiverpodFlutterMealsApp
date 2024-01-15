import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({super.key, required this.category , required this.selectedCategory});
  final Category category;
  final Function() selectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin:const EdgeInsets.fromLTRB(12,8,4,8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [category.color.withOpacity(0.55),category.color.withOpacity(0.9)],
              begin: Alignment.topLeft,
              end : Alignment.bottomRight
            )
        ),
        child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color:Theme.of(context).colorScheme.onBackground,
        ),)
      ),
    );
  }
}
