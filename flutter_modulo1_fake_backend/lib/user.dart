import 'dart:io';

enum Gender { MALE, FEMALE }

class User {
  int id;
  final String nickname;
  final String password;
  final Gender gender;
  final File photo;

  User({this.id, this.nickname, this.password, this.gender, this.photo});

  bool login(String nickname, String password) {
    return (this.nickname == nickname) && (this.password == password);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
