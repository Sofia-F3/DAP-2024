import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rivpod/providers/name_provider.dart';

class DetailScreen extends ConsumerStatefulWidget {
  static const String routeName = 'detalles';
  final String? name;

  const DetailScreen({super.key, this.name});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.name != null) {
      _controller.text = widget.name!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name == null ? 'Agregar Nombre' : 'Editar Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {/*
                final name = _controller.text;
                if (name.isNotEmpty) {
                  if (widget.name == null) {
                    ref.read(nameListProvider.notifier).addName(name);
                  } else {
                    final index =
                        ref.read(nameListProvider).indexOf(widget.name!);
                    ref.read(nameListProvider.notifier).editName(index, name);
                  }
                  context.pop();
                }*/
              },
              child: Text(widget.name == null ? 'Agregar' : 'Guardar'),
            ),
            if (widget.name != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {/*
                  final index =
                      ref.read(nameListProvider).indexOf(widget.name!);
                  ref.read(nameListProvider.notifier).deleteName(index);
                  context.pop();*/
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: const Text('Eliminar'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
