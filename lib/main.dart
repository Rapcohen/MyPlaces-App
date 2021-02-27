import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_places_app/screens/add_place_screen.dart';
import 'package:my_places_app/screens/place_detail_screen.dart';
import 'package:my_places_app/screens/places_list_screen.dart';
import 'package:my_places_app/providers/places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Places(),
      child: MaterialApp(
        title: 'My Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (_) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (_) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
