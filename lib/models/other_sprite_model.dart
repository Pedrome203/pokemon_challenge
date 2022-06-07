import 'package:pokemon_challenge/models/home_sprite_model.dart';

class OtherSprite {
  HomeSprite? home;
  OtherSprite({this.home});
  factory OtherSprite.fromJson(Map<String, dynamic> data) {
    HomeSprite _home = HomeSprite.fromJson(data['home']);
    return OtherSprite(
      home: _home,
    );
  }
}
