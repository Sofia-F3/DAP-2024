// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  String userName;
  HomeScreen({super.key, this.userName = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geni@!!!'),
      ),
      body: Center(
        child: Text('Bienvenid@ $userName'),
      ),
    );
  }
}
