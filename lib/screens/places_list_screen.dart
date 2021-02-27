import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:my_places_app/providers/places.dart';
import 'package:my_places_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
          ),
        ],
      ),
      body: Consumer<Places>(
        child: Center(
          child: const Text('No Places Added Yet!'),
        ),
        builder: (context, places, chd) => places.items.isEmpty
            ? chd
            : ListView.builder(
                itemCount: places.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[index].image),
                  ),
                  title: Text(places.items[index].title),
                  onTap: () {
                    //Go to detail page
                  },
                ),
              ),
      ),
    );
  }
}
