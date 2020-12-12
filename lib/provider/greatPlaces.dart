import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: Random().nextDouble().toString(),
        image: image,
        title: title,
        location: null);
    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'image': newPlace.image.path,
      'title': newPlace.title,
    });
    notifyListeners();
  }
}
