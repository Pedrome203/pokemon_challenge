class HomeSprite {
  String? front;
  HomeSprite({this.front});
  factory HomeSprite.fromJson(Map<String, dynamic> data) {
    return HomeSprite(
      front: data['front_default'],
    );
  }
}
