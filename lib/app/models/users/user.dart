abstract class User {
  String? id;
  String? token;
  String? name;
  String? type;

  User({id, token, name, type});

  User.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
