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

class _CustomTextFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//Declaramos e cubit
    final registerCubit = context.watch<cubit.RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          onChanged: registerCubit.usernameChanged,
          label: 'Nombre de usuario',
          errorMessage: username.errorMessage,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          onChanged: (value) {
            registerCubit.useremailChanged(value);
          },
          label: "Correo Electronico",
          errorMessage: email.errorMessage,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          onChanged: registerCubit.onpasswordChanged,
          label: "Contraseña",
          errorMessage: password.errorMessage,
          isObscure: true,
        ),
        const SizedBox(height: 10),
        FilledButton.tonalIcon(
          label: const Text('Crear Usuario'),
          onPressed: () {
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save_as_sharp),
        ),
      ],
    ));
  }
}
