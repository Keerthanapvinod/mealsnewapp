import 'package:flutter/material.dart';
import 'package:meales/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key,});
  
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFILters=ref.watch(filtersProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      
      body:
         Column(
          children: [
            SwitchListTile(
              value: activeFILters[Filter.glutenFree]!,
               onChanged: (isChecked) {
                ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree,isChecked);
               },
               title:Text(
                'Gluten-free',style:Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:  Theme.of(context).colorScheme.background,
                ),
               ),
            subtitle: Text('only include gluten-free meals , ',
            style:Theme.of(context).textTheme.titleMedium!.copyWith(
                  color:  Theme.of(context).colorScheme.onBackground,
                ),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
             value: activeFILters[Filter.lactoseFree]!,
               onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree,isChecked);
               },
               title:Text(
                'Lactose-free',
                style:Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:  Theme.of(context).colorScheme.background,
                ),
               ),
            subtitle: Text(
              'only include latose-free meals , ',
            style:Theme.of(context).textTheme.titleMedium!.copyWith(
                  color:  Theme.of(context).colorScheme.onBackground,
                ),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
              value: activeFILters[Filter.vegitarian]!,
               onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree,isChecked);
               },
               title:Text(
                'vergitarian',
                style:Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:  Theme.of(context).colorScheme.background,
                ),
               ),
            subtitle: Text(
              'only include vegitarian meals , ',
            style:Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:  Theme.of(context).colorScheme.onBackground,
                ),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
              value: activeFILters[Filter.vegan]!,
               onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree,isChecked);
               },
               title:Text(
                'vegan',
                style:Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:  Theme.of(context).colorScheme.background,
                ),
               ),
            subtitle: Text(
              'only include vegan-free meals , ',
            style:Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:  Theme.of(context).colorScheme.onBackground,
                ),
               ),
               activeColor: Theme.of(context).colorScheme.tertiary,
               contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
          ],
        ),
    
    );
  }
}