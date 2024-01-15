import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meal_provider.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegiterian,
  vegan
}

class FiltersNotifier extends StateNotifier<Map<Filters,bool>>{
  FiltersNotifier():super({
    Filters.glutenFree: false ,
    Filters.lactoseFree: false,
    Filters.vegiterian: false,
    Filters.vegan: false
  });
  void setFilter(Filters filter , bool value){
    state = {
      ...state ,
      filter: value
    };
  }
  void setFilters(Map<Filters,bool> chosenFilters){
    state = chosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filters,bool>>((refs){
  return FiltersNotifier();
});


final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  final filteredMeals = meals.where( (meal){
      if( activeFilters[Filters.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if( activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if( activeFilters[Filters.vegan]! && !meal.isVegan){
        return false;
      }
      if( activeFilters[Filters.vegiterian]! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
  return filteredMeals;
});