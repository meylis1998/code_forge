import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  const AuthUser({
    required this.username,
    this.realName,
    this.ranking,
    this.isPremium = false,
  });

  final String username;
  final String? realName;
  final int? ranking;
  final bool isPremium;

  @override
  List<Object?> get props => [username, realName, ranking, isPremium];
}
