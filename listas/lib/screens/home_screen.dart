import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:listas/entities/pokemon.dart';
import 'package:listas/screens/details_screen.dart';
import 'package:listas/providers/provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(pokemonProvider.notifier).obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> listaPokemon = ref.watch(pokemonProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaPokemon.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(listaPokemon[index].nombre),
                    subtitle: Text(listaPokemon[index].tipo),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(listaPokemon[index].imagen),
                    ),
                    onTap: () {
                      ref.read(indexPokemonSeleccionado.notifier).state = index;
                      context.pushNamed(DetailScreen.name);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(indexPokemonSeleccionado.notifier).state = -1;
              context.pushNamed(DetailScreen.name);
            },
            child: const Icon(
              Icons.edit,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
