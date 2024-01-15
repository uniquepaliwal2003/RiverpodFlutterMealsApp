import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';



class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context , WidgetRef ref) {

    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(children: [
          SwitchListTile(
            value: activeFilters[Filters.glutenFree]!,
            onChanged: (tick) {
              ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, tick);
            },
            title:Text("Glutten-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            subtitle: Text("Only include Glutten-free meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (tick) {
              ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, tick);
            },
            title:Text("Lactose-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            subtitle: Text("Only include Lactose-free meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegiterian]!,
            onChanged: (tick) {
              ref.read(filtersProvider.notifier).setFilter(Filters.vegiterian, tick);
            },
            title:Text("Vegiterian",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            subtitle: Text("Only include vegiterian meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (tick) {
              ref.read(filtersProvider.notifier).setFilter(Filters.vegan, tick);

            },
            title:Text("Vegan",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            subtitle: Text("Only include vegan meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left: 34,right: 22),
          ),
        ]),
      );
  }
}
