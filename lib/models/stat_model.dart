class Stat {
  String? name;
  String? url;

  Stat({this.name, this.url});

  factory Stat.fromJson(Map<String, dynamic> data) {
    return Stat(
      name: data['name'],
      url: data['url'],
    );
  }
}
