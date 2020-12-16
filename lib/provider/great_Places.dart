import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db_util.dart';
import 'package:great_places/utils/location_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map((e) => Place(
              id: e['id'],
              title: e['title'],
              image: File(e['image']),
              location: PlaceLocation(
                latitude: e['latitude'],
                longitude: e['longitude'],
                address: e['address'],
              ),
            ))
        .toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  Future<void> addPlace(String title, File image, LatLng position) async {
    String address = await LocationUtil.getAddresFrom(position);

    final newPlace = Place(
        id: Random().nextDouble().toString(),
        image: image,
        title: title,
        location: PlaceLocation(
            latitude: position.latitude,
            longitude: position.longitude,
            address: address));
    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'image': newPlace.image.path,
      'title': newPlace.title,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'address': address,
    });
    notifyListeners();
  }
}
