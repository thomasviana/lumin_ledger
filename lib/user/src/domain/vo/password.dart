import 'package:equatable/equatable.dart';

class Password extends Equatable {
  final String value;

  const Password(this.value);

  /// Minimum eight characters, at least one letter and one number:
  bool get isValid {
    const passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    if (RegExp(passwordRegex).hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  List<Object?> get props => [value];
}
