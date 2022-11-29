import 'package:flutter/material.dart';

enum Flavor {
  ARAMA,
  ALEXDREAM,
  ELQUDS,
  GALSMANSOURA,
  SCHOOLEVERYWHERE,
  SMARTALEX,
  BLS,
  EURO,
  ALROWAD,
  GOLDEN,
  TANTAROYAL,
  INNOVATION,
  MERRYLAND,
  MDD,
  ROYALHOUSE,
  MILLENNIUM,
  SPS,
  TIBA
}

class FlavorValues {
  FlavorValues({
    required this.storagePath,
    required this.imagePath,
    required this.schoolName,
    required this.schoolWebsite,
    required this.baseUrl,
  });

  final String? baseUrl;
  final String? schoolName;
  final String? schoolWebsite;
  final String? imagePath;
  final String? storagePath;
  //Add other flavor specific values, e.g database name

}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig(
      {@required Flavor? flavor,
      Color color: Colors.blue,
      @required FlavorValues? values}) {
    _instance ??= FlavorConfig._internal(flavor!, flavor.name, color, values!);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isSchoolEveryWhere() =>
      _instance!.flavor == Flavor.SCHOOLEVERYWHERE;

  static bool isAlrowad() => _instance!.flavor == Flavor.ALROWAD;
}
