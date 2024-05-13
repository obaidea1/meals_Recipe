import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
//import 'package:meals/screens/meals.dart';

class FavoriteMealsNotifire extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifire() : super([]);

  bool toggleMealFavoriteState(Meal meal) {
    final mealsIsFavorite = state.contains(meal);

    if (mealsIsFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifire, List<Meal>>((ref) {
  return FavoriteMealsNotifire();
});
