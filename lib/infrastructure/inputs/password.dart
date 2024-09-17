import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, lenght }

class Password extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

//Getter to have the error messages handled.
  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordInputError.empty)
      return 'El campo es requerido';
    if (displayError == PasswordInputError.lenght)
      return 'El campo debe contener al menos 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.lenght;

    return null;
  }
}
