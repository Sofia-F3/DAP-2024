import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listas/entities/users.dart';
import 'package:listas/entities/pokemon.dart';

StateProvider<List<Users>> userProvider = StateProvider((ref) => [
      Users('sofi', '1234'),
      Users('hola', '5678'),
    ]);

StateProvider<List<Pokemon>> pokemonProvider = StateProvider((ref) => [
      Pokemon('Pikachu', 'Eléctrico',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbfzYtn-eRiOeIygbWQ6S5yecoe-TpaJGngA&s'),
      Pokemon('Charmander', 'Fuego',
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png'),
      Pokemon('Togepi', 'Normal',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPZR0ZB7PCULDaPus_EB7b-nQDRda3j_JcVA&s'),
      Pokemon('Charizard', 'Fuego',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxnHcsy6KiGjDw31evpwg1fqekzsOw9bg6LA&s'),
      Pokemon('Snorlax', 'Normal',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJSo2PVnYSGU3xid9cmQGhv7IsIEWOAnPiSg&s'),
    ]);

StateProvider<int> indexPokemonSeleccionado = StateProvider((ref) => -1);