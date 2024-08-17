import 'package:flutter/material.dart';
import 'package:formsapp/presentation/barrel.dart';

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
                const SizedBox(
                  height: 10,
                ),
                _CustomTextField(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? username = '';
  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) => username = value,
              label: 'Nombre de usuario',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacío';
                if (value.trim().isEmpty) return 'Campo vacío';
                if (value.length < 6) return 'Mas de 6 caracteres requeridos';
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              onChanged: (value) => email = value,
              label: "Correo Electronico",
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacío';
                if (value.trim().isEmpty) return 'Campo vacío';
                final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                if (!regExp.hasMatch(value))
                  return 'No tiene formato de correo';

                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              onChanged: (value) => password = value,
              label: "Contraseña",
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacío';
                if (value.trim().isEmpty) return 'Campo vacío';
                if (value.length < 6) return 'Mas de 6 caracteres requeridos';
              },
              isObscure: true,
            ),
            const SizedBox(height: 10),
            FilledButton.tonalIcon(
              label: const Text('Crear Usuario'),
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;
              },
              icon: const Icon(Icons.save_as_sharp),
            ),
          ],
        ));
  }
}
