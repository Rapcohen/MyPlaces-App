import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_places_app/screens/map_screen.dart';
import 'package:my_places_app/providers/places.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  const PlaceDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<Places>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            selectedPlace.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            child: const Text('View on Map'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => MapScreen(
                  initialLocation: selectedPlace.location,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
