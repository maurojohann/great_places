import 'package:flutter/material.dart';
import 'package:great_places/utils/app_routes.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
              }),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
