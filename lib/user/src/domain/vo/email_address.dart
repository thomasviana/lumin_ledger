import 'package:equatable/equatable.dart';

class EmailAddress extends Equatable {
  final String value;

  const EmailAddress(this.value);

  bool get isValid {
    const emailRegex = r'(^[\w\._+-]{1,}(\+[\w]{1,})?@[\w\.\-]{3,}.\w{2,5}$)';
    if (RegExp(emailRegex).hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  List<Object?> get props => [value];
}
