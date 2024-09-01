part of 'register_cubit.dart';

//Tjis is for the multiple states that the form can have at certain times.
enum FormState { valid, invalid, valiating, posting }

class RegisterFormState extends Equatable {
  final bool isValid;
  final FormState formStatus;
  final Username username;
  final String email;
  final Password password;

  const RegisterFormState({
    this.isValid = false,
    this.formStatus = FormState.invalid,
    this.username = const Username.pure(),
    this.email = '',
    this.password = const Password.pure(),
  });

//Ahora vamos a hacer una copia con el estado nuevo que queremos crear.
  RegisterFormState copyWith({
    bool? isValid,
    FormState? formStatus,
    Username? username,
    String? email,
    Password? password,
  }) =>
      //This means that if there is no value coming from the variable, that it can then use the current value that is stored in the variable at that time.
      RegisterFormState(
        isValid: isValid ?? this.isValid,
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, username, email, password, isValid];
}
