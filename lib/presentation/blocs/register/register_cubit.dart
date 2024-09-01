import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formsapp/infrastructure/inputs/password.dart';
import 'package:formsapp/infrastructure/inputs/username.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit: $state');
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password]),
      ),
    );
  }

  void useremailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void onpasswordChanged(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
          password: password,
          isValid: Formz.validate([state.username, password])),
    );
  }
}
