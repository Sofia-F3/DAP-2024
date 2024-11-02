import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listas/entities/users.dart';
import 'package:listas/entities/pokemon.dart';

StateProvider<List<Users>> userProvider = StateProvider((ref) => [
      Users('sofi', '1234'),
      Users('hola', '5678'),
    ]);

StateProvider<int> indexPokemonSeleccionado = StateProvider((ref) => -1);

final pokemonProvider = StateNotifierProvider<PokemonNotifier, List<Pokemon>>(
  (ref) => PokemonNotifier(),
);

class PokemonNotifier extends StateNotifier<List<Pokemon>> {
  PokemonNotifier() : super([]);

  final db = FirebaseFirestore.instance;

  Future<void> obtenerDatos() async {
    try {
      final querySnapshot = await db.collection("pokemon").get();

      final listaPokemon = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Pokemon(
          doc.id,
          data["nombre"] as String,
          data["tipo"] as String,
          data["imagen"] as String,
        );
      }).toList();
      state = listaPokemon;
    } catch (error) {
      print("Error al obtener datos: $error");
    }
  }

  Future<void> subirDatos(nombre, tipo, imagen) async {
    try {
      await db
          .collection("pokemon")
          .add({"nombre": nombre, "tipo": tipo, "imagen": imagen});
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }

  Future<void> modificarDatos(id, nombre, tipo, imagen) async {
    try {
      await db.collection("pokemon").doc(id).set(
          {"nombre": nombre, "tipo": tipo, "imagen": imagen},
          SetOptions(merge: true));
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }
}
