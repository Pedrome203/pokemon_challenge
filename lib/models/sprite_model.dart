import 'package:pokemon_challenge/models/other_sprite_model.dart';

class Sprite {
  OtherSprite? other;
  Sprite({this.other});
  factory Sprite.fromJson(Map<String, dynamic> data) {
    OtherSprite _other = OtherSprite.fromJson(data['other']);
    return Sprite(
      other: _other,
    );
  }
}
