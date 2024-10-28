// ignore_for_file: must_be_immutable
import 'package:listas/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listas/entities/users.dart';
import 'package:listas/providers/provider.dart';

class LoginScreen extends ConsumerWidget {
  static const String name = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final List<Users> listaUsuarios = ref.watch(userProvider);

    var snackBar_1 = SnackBar(
        content: const Text("Usuario incorrecto"),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Descartar',
          onPressed: () {},
        ));

    var snackBar_2 = SnackBar(
        content: const Text("Contraseña incorrecta"),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Descartar',
          onPressed: () {},
        ));

    return Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Logueate: ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
            width: 600,
            child: TextField(
              controller: userController,
              decoration: const InputDecoration(
                  hintText: 'Usuario ', icon: Icon(Icons.person)),
            ),
          ),
          SizedBox(
            height: 100,
            width: 600,
            child: TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Contraseña', icon: Icon(Icons.key)),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                int x = listaUsuarios.indexWhere(
                    (usuario) => usuario.user == userController.text);
                //indexWhere devuelve -1 si no encuentra
                if (x != -1) {
                  if (listaUsuarios[x].pass == passController.text) {
                    context.pushNamed(HomeScreen.name,
                        extra: userController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar_2);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar_1);
                }
              },
              child: const Text("Login")),
        ],
      )));
  }
}
