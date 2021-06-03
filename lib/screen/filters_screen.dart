import 'package:flutter/material.dart';
import 'package:recepie/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String filterScreenRoute = '/filter';
  final void Function(Map<String, bool>) savedFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.savedFilters, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;

    super.initState();
  }

  Widget _switchListTile(String title, String subtitle, bool value,
      void Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subtitle),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.savedFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Secection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _switchListTile(
                  'Gluten-Free', 'Selects Gluten Free Meals', _glutenFree,
                  (newValue) {
                setState(
                  () {
                    _glutenFree = newValue;
                  },
                );
              }),
              _switchListTile(
                  'Vegetarian', 'Selects Vegatarian Meals', _vegetarian,
                  (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              }),
              _switchListTile('Vegan', 'Selects Vegan Meals ', _vegan,
                  (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              }),
              _switchListTile(
                  'Lactose-Free', 'Selects Lactose Free Meals ', _lactoseFree,
                  (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              })
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
