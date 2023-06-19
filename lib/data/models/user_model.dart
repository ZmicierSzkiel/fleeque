import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

import 'package:fleeque/domain/entities/user.dart';

class UserMapper extends User {
  const UserMapper({
    required String email,
    required String id,
  }) : super(email: email, id: id);

  static UserMapper fromFirebaseUser(fb_auth.User fbUser) {
    return UserMapper(
      email: fbUser.email ?? '',
      id: fbUser.uid,
    );
  }

  static UserMapper fromJson(Map<String, dynamic> json) {
    return UserMapper(
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'id': id};
}
