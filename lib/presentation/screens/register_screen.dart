import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/infrastructure/inputs/username.dart';

import 'package:formsapp/presentation/widgets/input/custom_text_form_field.dart';

import '../blocs/register/register_cubit.dart' as cubit;

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => cubit.RegisterCubit(),
        child: SafeArea(
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
                  _CustomTextFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextFormField extends StatefulWidget {
  @override
  State<_CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<_CustomTextFormField> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
//Declaramos e cubit
    final registerCubit = context.watch<cubit.RegisterCubit>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) {
                registerCubit.usernameChanged(value);
                _formKey.currentState?.validate();
              },
              label: 'Nombre de usuario',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo vacío';
                if (value.trim().isEmpty) return 'Campo vacío';
                if (value.length < 6) return 'Mas de 6 caracteres requeridos';
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              onChanged: (value) {
                registerCubit.useremailChanged(value);
                _formKey.currentState?.validate();
              },
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
              onChanged: (value) {
                registerCubit.onpasswordChanged(value);
                _formKey.currentState?.validate();
              },
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

                registerCubit.onSubmit();
              },
              icon: const Icon(Icons.save_as_sharp),
            ),
          ],
        ));
  }
}
