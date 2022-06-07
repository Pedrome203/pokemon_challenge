import 'package:pokemon_challenge/models/type_model.dart';

class Types {
  int? slot;
  Type? type;
  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> data) {
    Type _type = Type.fromJson(data['type']);

    return Types(
      slot: data['slot'],
      type: _type,
    );
  }
}
