// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  String userName;
  HomeScreen({super.key, this.userName = ''});

  List<String> nombres = [
    "Pikachu",
    "Charmander",
    "Togepi",
    "Charizard",
    "Snorlax"
  ];
  List<String> desc = [
    "Pokémon de color amarillo basado en un ratón",
    "Pokémon de color rojo basado en una salamandra",
    "Pokémon de muchos colores basado en huevo",
    "Pokémon evolución de charmander",
    "Pokémon enorme y dormilón"
  ];
  int i = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pokémon'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          i = i + 1;
          return Card(
            child: ListTile(
              title: Text(nombres[i]),
              subtitle: Text(desc[i]),
            ),
          );
        },
      ),
    );
  }
}
