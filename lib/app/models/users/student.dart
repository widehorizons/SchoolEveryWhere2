import 'user.dart';

class Student implements User {
  @override
  String? id;

  @override
  String? name;

  @override
  String? token;

  @override
  String? type;
  String? section;
  String? stage;
  String? studentClass;
  String? grade;
  String? academicYear;
  String? semester;

  Student(
      {this.id,
      this.token,
      this.name,
      this.type,
      this.section,
      this.stage,
      this.studentClass,
      this.grade,
      this.academicYear,
      this.semester});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    token = json['token'];
    section = json['section'];
    academicYear = json['year'];
    stage = json['stage'];
    grade = json['grade'];
    semester = json['semester'];
    studentClass = json['studentClass'];
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['token'] = token;
    map['type'] = type;
    map['name'] = name;
    map['section'] = section;
    map['year'] = academicYear;
    map['stage'] = stage;
    map['grade'] = grade;
    map['semester'] = semester;
    map['studentClass'] = studentClass;
    return map;
  }
}
