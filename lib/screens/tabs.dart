import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meales/screens/categories.dart';
import 'package:meales/screens/filters.dart';
import 'package:meales/screens/meals.dart';
import 'package:meales/widgets/main_drawer.dart';
import 'package:meales/provider/favorites_provider.dart';
import 'package:meales/provider/filters_provider.dart';

const kIntelFilters={
    Filter.glutenFree:false,
    Filter.lactoseFree:false,
    Filter.vegitarian:false,
    Filter.vegan:false,
  };

class  TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen>{
  int _selectedPageIndex=0;
   

  
  

  
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  void _setScreen(String identifier)async{
    if (identifier=='filters'){
   await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder:(ctx) => const FiltersScreen(),
      ),
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    final availableMeals =ref.watch(filterdMealsProvide);
      
    Widget activePage = CategoriesScreen(
    
      availableMeals: availableMeals,
      );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex==1){
      final   favoriteMeals =ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
      meals:favoriteMeals,
     
      );
      activePageTitle='Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title:Text(activePageTitle) ,
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
        ),
      body:activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
       currentIndex: _selectedPageIndex,
         items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label:'Favorites' ,
          ),
        ],
      ),
    );
  }

}