import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your Filters"), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilter);
              })
        ]),
        drawer: MainDrawer(),
        body: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection.',
                  style: Theme.of(context).textTheme.headline6)),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile("Gluten Free",
                    "Only include Gluten Free Meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Lactose Free",
                    "Only include Lactose Free Meals",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include Vegetarian Meals", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include Vegan Meals", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ),
          )
        ]));
  }
}
