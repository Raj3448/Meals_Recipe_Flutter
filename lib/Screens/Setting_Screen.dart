import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static const routeName = '/Settings';
  final Function setSettingData;
  final Map<String, bool> currentData;

  Settings(this.currentData, this.setSettingData);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool glutenFree = false;

  bool lacotoFree = false;

  bool vegiterian = false;

  bool nonVeg = false;

  void initState() {
    glutenFree = widget.currentData['glutenfree'] as bool;
    lacotoFree = widget.currentData['lactofree'] as bool;
    vegiterian = widget.currentData['vegiterian'] as bool;
    nonVeg = widget.currentData['NonVegiterian'] as bool;

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subTitle, bool currentVal,
      void Function(bool)? updatedVal) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Robot',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subTitle),
        value: currentVal,
        onChanged: updatedVal);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> _SettingsData = {
                  'glutenfree': glutenFree,
                  'lactofree': lacotoFree,
                  'vegiterian': vegiterian,
                  'NonVegiterian': nonVeg,
                };
                widget.setSettingData(_SettingsData);
              },
              icon: Icon(Icons.save_as_rounded))
        ],
      ),
      //drawer: Drawer_Screen(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Dishes Selection !',
              style: TextStyle(
                fontFamily: 'Robot',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'GluteenFree',
                    'Its including gluteenfree dishe\'s',
                    glutenFree, (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'MilkFree', 'Its including milkfree dishe\'s', lacotoFree,
                    (newValue) {
                  setState(() {
                    lacotoFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegiterian',
                    'Its including vegiterian dishe\'s',
                    vegiterian, (newValue) {
                  setState(() {
                    vegiterian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Non-vegiterian',
                    'Its including non-vegiterian dishe\'s',
                    nonVeg, (newValue) {
                  setState(() {
                    nonVeg = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
