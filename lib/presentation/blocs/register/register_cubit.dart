import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formsapp/infrastructure/inputs/email.dart';
import 'package:formsapp/infrastructure/inputs/password.dart';
import 'package:formsapp/infrastructure/inputs/username.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Submit: $state');

//We are making this so we can get the value dirty even if it has no data in it.
    emit(state.copyWith(
        formStatus: FormState.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.username, state.password])));
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
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([state.username, state.password, email]),
    ));
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
