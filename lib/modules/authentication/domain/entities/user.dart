import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final bool emailVerified;

  const User({
    this.id = '',
    this.name = '',
    required this.email,
    this.password = '',
    this.emailVerified = false,
  });

  @override
  List<Object?> get props => [name, email, password, emailVerified];
}
