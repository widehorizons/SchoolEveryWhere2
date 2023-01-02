import 'dart:convert';

class LoginDTO {
  final String username;
  final String password;
  final String type;
  final String identidier;
  LoginDTO({
    required this.username,
    required this.password,
    required this.type,
    required this.identidier,
  });

  LoginDTO copyWith({
    String? username,
    String? password,
    String? type,
    String? identidier,
  }) {
    return LoginDTO(
      username: username ?? this.username,
      password: password ?? this.password,
      type: type ?? this.type,
      identidier: identidier ?? this.identidier,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'type': type,
      'identidier': identidier,
    };
  }

  factory LoginDTO.fromMap(Map<String, dynamic> map) {
    return LoginDTO(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      type: map['type'] ?? '',
      identidier: map['identidier'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDTO.fromJson(String source) => LoginDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginDTO(username: $username, password: $password, type: $type, identidier: $identidier)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginDTO &&
      other.username == username &&
      other.password == password &&
      other.type == type &&
      other.identidier == identidier;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      password.hashCode ^
      type.hashCode ^
      identidier.hashCode;
  }
}