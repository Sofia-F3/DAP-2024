// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listas/providers/provider.dart';
import 'package:listas/entities/pokemon.dart';
import 'package:listas/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerWidget {
  static const String name = 'detalles';
  DetailScreen({super.key});
  TextEditingController nombrePokeController = TextEditingController();
  TextEditingController tipoPokeController = TextEditingController();
  TextEditingController imagenPokeController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {
    final List<Pokemon> listaPokemon = ref.watch(pokemonProvider);
    final index = ref.watch(indexPokemonSeleccionado);

    bool modoAgregar;
    if (index != -1) {
      nombrePokeController.text = listaPokemon[index].nombre;
      tipoPokeController.text = listaPokemon[index].tipo;
      imagenPokeController.text = listaPokemon[index].imagen;
      modoAgregar = false;
    } else {
      modoAgregar = true;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: nombrePokeController,
                decoration: const InputDecoration(
                  hintText: "Nombre del pokemon",
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 350,
              child: TextField(
                controller: tipoPokeController,
                decoration: const InputDecoration(
                  hintText: "Tipo principal del pokemon",
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 350,
              child: TextField(
                controller: imagenPokeController,
                decoration: const InputDecoration(
                  hintText: "poner el link de la imagen del pokemon",
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (modoAgregar) {
                  ref.read(pokemonProvider.notifier).subirDatos(
                      nombrePokeController.text,
                      tipoPokeController.text,
                      imagenPokeController.text);
                } else {
                  ref.read(pokemonProvider.notifier).modificarDatos(
                      listaPokemon[index].id,
                      nombrePokeController.text,
                      tipoPokeController.text,
                      imagenPokeController.text);
                }
                context.pushNamed(HomeScreen.name);
              },
              child: Text(
                modoAgregar ? "Agregar" : "Modificar",
              ),
            ),
            const SizedBox(height: 10),
            if (!modoAgregar)
              ElevatedButton(
                onPressed: () {
                  db.collection("pokemon").doc(listaPokemon[index].id).delete();
                  context.pushNamed(HomeScreen.name);
                },
                child: const Text(
                  "Eliminar",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
