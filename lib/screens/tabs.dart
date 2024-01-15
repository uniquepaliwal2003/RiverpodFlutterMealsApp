import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorites_provider.dart';
import 'package:meals_app/provider/filters_provider.dart';
Map<Filters,bool> kInitialFilters = {
      Filters.glutenFree: false,
      Filters.lactoseFree: false, 
      Filters.vegan: false, 
      Filters.vegiterian: false
  };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;    
  void _selectPage(int index ){
    setState(() {
      _selectedIndex = index;
    });
  }
  void _setScreen( String identifer) async{
    Navigator.of(context).pop();
    if( identifer =="filters" ){
       await Navigator.of(context).push<Map<Filters,bool>>(
        MaterialPageRoute(
          builder: (ctx)=>const FilterScreen() 
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final avaiableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(avaiableMeals: avaiableMeals,);

    String activePageTitle = "Categories";
    if( _selectedIndex == 1 ){
      final favoriteMeals = ref.watch(favoriteProvider);
      activePage = MealsScreen(meals:  favoriteMeals );
      activePageTitle = "Your Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen ,),
      body:activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal) , label:"Categories" ),
          BottomNavigationBarItem(icon: Icon(Icons.star ) , label: "Favorites" )
        ],
      ),
    );
  }
}