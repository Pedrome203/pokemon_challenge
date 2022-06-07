class Type {
  String? name;
  String? url;
  Type({this.name, this.url});
  factory Type.fromJson(Map<String, dynamic> data) {
    return Type(
      name: data['name'],
      url: data['url'],
    );
  }
}
