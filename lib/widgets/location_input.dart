import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  LocationInput({Key key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: const Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getUserLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: const Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                //..
              },
            ),
          ],
        )
      ],
    );
  }

  Future<void> _getUserLocation() async {
    final locData = await Location().getLocation();
  }
}
