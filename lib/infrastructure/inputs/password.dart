import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty, lenght }

class Password extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameInputError.empty;
    if (value.length < 6) return UsernameInputError.lenght;

    return null;
  }
}
