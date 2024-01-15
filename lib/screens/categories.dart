import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key ,  required this.avaiableMeals});
  final List<Meal> avaiableMeals ;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1
    );
    _animationController.forward();
  }
  @override
  void dispose() {
  _animationController.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context , Category category){
    final fileterMeals = widget.avaiableMeals.where((meal)=> meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(builder: 
        (ctx)=> MealsScreen(title: category.title, meals: fileterMeals )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
       child:GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , crossAxisSpacing: 20, mainAxisSpacing: 20 , childAspectRatio: 1.5),
          children: [
            for(final category in availableCategories )
              CategoriesGridItem(category: category , selectedCategory:(){ _selectedCategory(context , category); } )
          ],
      ) ,
      builder: (context,child)=>Padding(
        padding:EdgeInsets.only(top:100- _animationController.value*100) ,
        child: child,
      )
    );  
  }
}