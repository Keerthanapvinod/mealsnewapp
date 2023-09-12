

//import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meales/provider/meals_provider.dart';

enum Filter{
glutenFree,
lactoseFree,
vegitarian,
vegan,
}

class FiltersNOtifier extends StateNotifier<Map<Filter,bool>>{
  FiltersNOtifier(): 
   super({
      Filter.glutenFree:false,
      Filter.lactoseFree:false,
      Filter.vegitarian:false,
      Filter.vegan:false,
  });
  void setFilters(Map<Filter,bool>chosenFilters){
    state =chosenFilters;
  }

  void setFilter(Filter filter,bool isActive){
    //state(filter)=isActive: not allowed => mutating state
    state={
      ...state,
      filter:isActive,
    };
  }
}

final filtersProvider =StateNotifierProvider<FiltersNOtifier,Map<Filter,bool>>(
  (ref) => FiltersNOtifier(),
);

final filterdMealsProvide = Provider((ref) {
  final meals =ref.watch(mealsProvider);
  final activeFilters=ref.watch(filtersProvider);

  return meals.where((meal) {
   if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
       if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
       }
        if (activeFilters[Filter.vegitarian]! && !meal.isVegetarian){
        return false;
    }
    
        if (activeFilters[Filter.vegan]! && !meal.isVegan){
        return false;
    }
    return true;
    }).toList();
});