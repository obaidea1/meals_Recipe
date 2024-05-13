import 'package:flutter/material.dart';
//import 'package:meals/screens/tabs.dart';
//import 'package:meals/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
              value: activeFilters[Filter.glutenFree]!,
              title: Text(
                'Gluten-free',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
              value: activeFilters[Filter.lactoseFree]!,
              title: Text(
                'lactose-free',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              value: activeFilters[Filter.vegetarian]!,
              title: Text(
                'Vegetarian',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ));
  }
}
