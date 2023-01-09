class ScreenIcon {
  ScreenIcon({
    required this.title,
    required this.imageURL,
    required this.notify,
  });
  late final String title;
  late final String imageURL;
  late final int notify;

  ScreenIcon.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageURL = json['Imageurl'];
    notify = json['notify'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['Imageurl'] = imageURL;
    _data['notify'] = notify;
    return _data;
  }
}
