import 'package:flutter/material.dart';
//import 'package:meals/data/dummy_data.dart';
//import 'package:meals/models/meal.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/screens/category.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filter_provider.dart';

const kInitialFilters = {
    Filter.glutenFree :false,
    Filter.lactoseFree :false,
    Filter.vegetarian :false,
  };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectPageIndex = 0;

  

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  void _setScreen(String indentifier) async{
    Navigator.of(context).pop();
    if (indentifier == 'filters') {
     await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    } 
    
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = ref.watch(filteredMealProvider);
    Widget activePage = CategoryScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';

    if (_selectPageIndex == 1) {
      final mealsFavourite = ref.watch(favoriteMealsProvider);
      activePage = Meals(
        meals: mealsFavourite,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Catagories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
