// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  String name;
  String email;
  String phone;
  String? avatar;
  DateTime dateOfBirth;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,
    required this.dateOfBirth,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    DateTime? dateOfBirth,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      dateOfBirth: DateTime.parse(map['dateOfBirth'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.avatar == avatar &&
        other.dateOfBirth == dateOfBirth;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        avatar.hashCode ^
        dateOfBirth.hashCode;
  }
}
