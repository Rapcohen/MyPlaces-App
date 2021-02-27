import 'package:flutter/foundation.dart';

import 'package:my_places_app/models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
