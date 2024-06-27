// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:listas/entities/pokemon.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  String userName;
  HomeScreen({super.key, this.userName = ''});

  int i = -1;

  List<Pokemon> pokemones = [
    Pokemon('Pikachu', 'Pokémon de color amarillo basado en un ratón', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbfzYtn-eRiOeIygbWQ6S5yecoe-TpaJGngA&s'),
    Pokemon('Charmander', 'Pokémon de color rojo basado en una salamandra', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKbBGiEX3Q2YPLATRjW0gytIZqRnbOmYsR1Q&s'),
    Pokemon('Togepi', 'Pokémon de muchos colores basado en huevo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPZR0ZB7PCULDaPus_EB7b-nQDRda3j_JcVA&s'),
    Pokemon('Charizard', 'Pokémon evolución de charmander', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxnHcsy6KiGjDw31evpwg1fqekzsOw9bg6LA&s'),
    Pokemon('Snorlax', 'Pokémon enorme y dormilón', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJSo2PVnYSGU3xid9cmQGhv7IsIEWOAnPiSg&s'),
  ];

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
              title: Text(pokemones[i].poke),
              subtitle: Text(pokemones[i].desc),
              leading: SizedBox(width: 50, height: 50, child: Image.network(pokemones[i].imagen))
            ),
          );
        },
      ),
    );
  }
}
