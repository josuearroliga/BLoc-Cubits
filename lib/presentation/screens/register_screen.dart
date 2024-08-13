import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo Usuario'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const FlutterLogo(
                    size: 100,
                  ),
                  TextField(),
                  TextField(),
                  TextField(),
                  TextField(),
                  const SizedBox(height: 15),
                  FilledButton.tonalIcon(
                    label: const Text('Crear Usuario'),
                    onPressed: () {},
                    icon: const Icon(Icons.save_as_sharp),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
