import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Lógica para mostrar los resultados basados en la búsqueda
    return Center(
      child: Text('Resultados para: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias de búsqueda mientras se escribe
    return ListView(
      children: [
        ListTile(
          title: Text('Sugerencia 1'),
          onTap: () {
            // Lógica al seleccionar una sugerencia
            query = 'Sugerencia 1';
          },
        ),
        ListTile(
          title: Text('Sugerencia 2'),
          onTap: () {
            // Lógica al seleccionar una sugerencia
            query = 'Sugerencia 2';
          },
        ),
      ],
    );
  }
}
