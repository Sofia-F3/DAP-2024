import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivpod/providers.dart';
import 'package:rivpod/screens/details_screen.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nombres = ref.watch(nameListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Nombres'),
      ),
      body: ListView.builder(
        itemCount: nombres.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(nombres[index]),
              onTap: () {
                context.pushNamed(
                  DetailScreen.routeName,
                  extra: nombres[index],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(DetailScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
