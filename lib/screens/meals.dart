import 'package:flutter/material.dart';

import 'package:meales/models/meal.dart';
import 'package:meales/screens/meals_details.dart';
import 'package:meales/widgets/meal_iteam.dart';
//import 'package:meales/data/dummy_data.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({
  super.key,
  this.title,
  required this.meals,
 
  });

  final String? title; 
  final List<Meal> meals;
  
   
  void selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:(ctx)=>MealsDetailsScreen(
          meal: meal,
          
          ), 
          
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content=Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
       Text('uh oh... noting here !',
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
        ),
      ) ,
      const SizedBox(height: 16),
      Text('try selecting a different category!',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,)
        
     ,)
      ],
      ),
      ); 
  

    if(meals.isNotEmpty){
      content= ListView.builder(
        itemCount:meals.length ,
    itemBuilder:(ctx, index)=>MealIteam(
      meal:meals[index],
      onselectMeal:(meal){
        selectMeal(context, meal);
      } ,),
    );
    }
    
    if (title==null){
      return content;
    }

   return Scaffold(
    appBar: AppBar(
      title: Text(title!),
    ),
    body:content,
   );
  }
}