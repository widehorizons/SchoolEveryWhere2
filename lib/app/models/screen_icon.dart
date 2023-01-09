import 'dart:convert';

class ScreenIcon {
  final String title;
  final String imageURL;
  final int notify;
  ScreenIcon({
    required this.title,
    required this.imageURL,
    required this.notify,
  });

  ScreenIcon copyWith({
    String? title,
    String? imageURL,
    int? notify,
  }) {
    return ScreenIcon(
      title: title ?? this.title,
      imageURL: imageURL ?? this.imageURL,
      notify: notify ?? this.notify,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'Imageurl': imageURL,
      'notify': notify,
    };
  }

  factory ScreenIcon.fromMap(Map<String, dynamic> map) {
    return ScreenIcon(
      title: map['title'] ?? '',
      imageURL: map['Imageurl'] ?? '',
      notify: map['notify']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScreenIcon.fromJson(String source) =>
      ScreenIcon.fromMap(json.decode(source));

  @override
  String toString() =>
      'ScreenIcon(title: $title, imageURL: $imageURL, notify: $notify)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScreenIcon &&
        other.title == title &&
        other.imageURL == imageURL &&
        other.notify == notify;
  }

  @override
  int get hashCode => title.hashCode ^ imageURL.hashCode ^ notify.hashCode;
}
