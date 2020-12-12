import 'package:flutter/material.dart';
import 'package:great_places/provider/greatPlaces.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text('Nenhum Local adicionado'),
        ),
        builder: (context, value, child) => value.itemsCount == 0
            ? child
            : ListView.builder(
                itemCount: value.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                      backgroundImage: FileImage(value.itemByIndex(i).image)),
                  title: Text(value.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
