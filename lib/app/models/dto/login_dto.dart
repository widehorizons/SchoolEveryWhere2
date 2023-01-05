import 'dart:convert';

class LoginDTO {
  final String username;
  final String password;
  final String type;
  final String identifier;
  LoginDTO({
    required this.username,
    required this.password,
    required this.type,
    required this.identifier,
  });

  LoginDTO copyWith({
    String? username,
    String? password,
    String? type,
    String? identifier,
  }) {
    return LoginDTO(
      username: username ?? this.username,
      password: password ?? this.password,
      type: type ?? this.type,
      identifier: identifier ?? this.identifier,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'type': type,
      'identifier': identifier,
    };
  }

  factory LoginDTO.fromMap(Map<String, dynamic> map) {
    return LoginDTO(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      type: map['type'] ?? '',
      identifier: map['identifier'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDTO.fromJson(String source) =>
      LoginDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginDTO(username: $username, password: $password, type: $type, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginDTO &&
        other.username == username &&
        other.password == password &&
        other.type == type &&
        other.identifier == identifier;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        type.hashCode ^
        identifier.hashCode;
  }
}
