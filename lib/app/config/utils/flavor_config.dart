import 'package:flutter/material.dart';

enum Flavor {
  arama,
  alexdream,
  elquds,
  galasmansoura,
  schooleverywhere,
  smartalex,
  smart,
  bls,
  euro,
  alrowad,
  golden,
  harvard,
  tantaroyal,
  innovation,
  merryland,
  mdd,
  royalhouse,
  millennium,
  sps,
  tiba
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
  final ThemeData theme;
  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig(
      {@required Flavor? flavor,
      required ThemeData theme,
      @required FlavorValues? values}) {
    _instance ??= FlavorConfig._internal(flavor!, flavor.name, theme, values!);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.theme, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isSchoolEveryWhere() =>
      _instance!.flavor == Flavor.schooleverywhere;

  static bool isAlrowad() => _instance!.flavor == Flavor.alrowad;
}
