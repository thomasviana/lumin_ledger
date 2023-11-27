import 'package:equatable/equatable.dart';

class PhoneNumber extends Equatable {
  final String value;

  const PhoneNumber(this.value);

  bool get isValid {
    const nameRegex =
        r'^(([0]\d{1,2})?[\s.-]?[+-0]\d{1,3})?[\s.-]?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$';
    if (RegExp(nameRegex).hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  List<Object?> get props => [value];
}
