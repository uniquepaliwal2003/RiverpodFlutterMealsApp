import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_datails.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals });
  final String? title;
  final List<Meal> meals;
  void selecMeal(BuildContext context , Meal meal){
    Navigator.of(context).push( MaterialPageRoute(builder: (ctx)=>MealDetailsScreen(meal: meal ), ), );
  }
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh no ... nothing here ',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 20,
          ),
          Text("Try selecting a different Category!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground))
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
        return MealItem(meal: meals[index] , onSelectMeal: ( meal ){selecMeal(context,meal);},);
      });
    }
    if( title == null ){
      return content;
    }

    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
