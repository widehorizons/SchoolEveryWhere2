import 'user.dart';

class Staff extends User {
  String? section;
  String? sectionName;
  String? academicYear;
  String? stage;
  String? stageName;
  String? grade;
  String? gradeName;
  String? semester;
  String? semesterName;
  String? staffClass;
  String? staffClassName;
  String? subject;
  String? subjectName;
  bool? supervisorStaff;
  String? supervisorId;

  Staff({
    this.section,
    this.sectionName,
    this.academicYear,
    this.stage,
    this.stageName,
    this.grade,
    this.gradeName,
    this.semester,
    this.semesterName,
    this.staffClass,
    this.staffClassName,
    this.subject,
    this.subjectName,
    this.supervisorStaff,
    this.supervisorId,
  });

  Staff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    token = json['token'];
    section = json['section'];
    sectionName = json['sectionName'];
    academicYear = json['academicYear'];
    stage = json['stage'];
    stageName = json['stageName'];
    grade = json['grade'];
    gradeName = json['gradeName'];
    semester = json['semester'];
    semesterName = json['semesterName'];
    staffClass = json['staffClass'];
    staffClassName = json['staffClassName'];
    subject = json['subject'];
    subjectName = json['subjectName'];
    supervisorStaff = json['supervisorStaff'];
    supervisorId = json['supervisorId'];
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map['section'] = section;
    map['sectionName'] = sectionName;
    map['academicYear'] = academicYear;
    map['stage'] = stage;
    map['stageName'] = stageName;
    map['grade'] = grade;
    map['gradeName'] = gradeName;
    map['semester'] = semester;
    map['semesterName'] = semesterName;
    map['staffClass'] = staffClass;
    map['staffClassName'] = staffClassName;
    map['subject'] = subject;
    map['subjectName'] = subjectName;
    map['supervisorStaff'] = supervisorStaff;
    map['supervisorId'] = supervisorId;
    return map;
  }

  Staff copyWith({
    String? section,
    String? sectionName,
    String? academicYear,
    String? stage,
    String? stageName,
    String? grade,
    String? gradeName,
    String? semester,
    String? semesterName,
    String? staffClass,
    String? staffClassName,
    String? subject,
    String? subjectName,
    bool? supervisorStaff,
    String? supervisorId,
  }) {
    return Staff(
      section: section ?? this.section,
      sectionName: sectionName ?? this.sectionName,
      academicYear: academicYear ?? this.academicYear,
      stage: stage ?? this.stage,
      stageName: stageName ?? this.stageName,
      grade: grade ?? this.grade,
      gradeName: gradeName ?? this.gradeName,
      semester: semester ?? this.semester,
      semesterName: semesterName ?? this.semesterName,
      staffClass: staffClass ?? this.staffClass,
      staffClassName: staffClassName ?? this.staffClassName,
      subject: subject ?? this.subject,
      subjectName: subjectName ?? this.subjectName,
      supervisorStaff: supervisorStaff ?? this.supervisorStaff,
      supervisorId: supervisorId ?? this.supervisorId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'section': section,
      'sectionName': sectionName,
      'academicYear': academicYear,
      'stage': stage,
      'stageName': stageName,
      'grade': grade,
      'gradeName': gradeName,
      'semester': semester,
      'semesterName': semesterName,
      'staffClass': staffClass,
      'staffClassName': staffClassName,
      'subject': subject,
      'subjectName': subjectName,
      'supervisorStaff': supervisorStaff,
      'supervisorId': supervisorId,
    };
  }

  factory Staff.fromMap(Map<String, dynamic> map) {
    return Staff(
      section: map['section'],
      sectionName: map['sectionName'],
      academicYear: map['academicYear'],
      stage: map['stage'],
      stageName: map['stageName'],
      grade: map['grade'],
      gradeName: map['gradeName'],
      semester: map['semester'],
      semesterName: map['semesterName'],
      staffClass: map['staffClass'],
      staffClassName: map['staffClassName'],
      subject: map['subject'],
      subjectName: map['subjectName'],
      supervisorStaff: map['supervisorStaff'],
      supervisorId: map['supervisorId'],
    );
  }

  @override
  String toString() {
    return 'Staff(section: $section, sectionName: $sectionName, academicYear: $academicYear, stage: $stage, stageName: $stageName, grade: $grade, gradeName: $gradeName, semester: $semester, semesterName: $semesterName, staffClass: $staffClass, staffClassName: $staffClassName, subject: $subject, subjectName: $subjectName, supervisorStaff: $supervisorStaff, supervisorId: $supervisorId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Staff &&
        other.section == section &&
        other.sectionName == sectionName &&
        other.academicYear == academicYear &&
        other.stage == stage &&
        other.stageName == stageName &&
        other.grade == grade &&
        other.gradeName == gradeName &&
        other.semester == semester &&
        other.semesterName == semesterName &&
        other.staffClass == staffClass &&
        other.staffClassName == staffClassName &&
        other.subject == subject &&
        other.subjectName == subjectName &&
        other.supervisorStaff == supervisorStaff &&
        other.supervisorId == supervisorId;
  }

  @override
  int get hashCode {
    return section.hashCode ^
        sectionName.hashCode ^
        academicYear.hashCode ^
        stage.hashCode ^
        stageName.hashCode ^
        grade.hashCode ^
        gradeName.hashCode ^
        semester.hashCode ^
        semesterName.hashCode ^
        staffClass.hashCode ^
        staffClassName.hashCode ^
        subject.hashCode ^
        subjectName.hashCode ^
        supervisorStaff.hashCode ^
        supervisorId.hashCode;
  }
}
