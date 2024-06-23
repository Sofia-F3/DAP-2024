// ignore_for_file: must_be_immutable

import 'package:TP1/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String user = "eliysofi";
  String pass = "somoslindas";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login: ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Insert user: ',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.key)
                  ),
              ),
              ElevatedButton(
                onPressed: (){
                  if(userController.text == 'eliysofi' && passController.text == 'somoslindas'){
                    print("Continue");
                    context.pushNamed(HomeScreen.name, extra: userController.text);
                  }
                  else if(userController.text == '' && passController.text == ''){
                    print('Insertar usuario y contraseña');
                  }
                  else if(userController.text == ''){
                    print('Insertar usuario');
                  }
                  else if(passController.text == ''){
                    print('Insertar contraseña');
                  }
                  else if(userController.text != user || passController.text != pass){
                    print('Usuario o Contraseña incorrecto');
                  }
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
      ),
    );
  }
}
