import 'package:flutter/material.dart';
// import 'package:formsapp/config/routers/app_router.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView(
        children: [
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            onTap: () => context.push('/cubits'), //TODO
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text('BLoc'),
            subtitle: const Text('Gestor de estado avanzado'),
            onTap: () => context.push('/bloc'), //TODO
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            title: const Text('Crear Nuevo Usuario'),
            subtitle: const Text('Formulario de creacion de usuario'),
            onTap: () => context.push('/register-page'), //TODO
          ),
        ],
      )),
    );
  }
}
