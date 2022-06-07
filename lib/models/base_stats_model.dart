import 'package:pokemon_challenge/models/stat_model.dart';

class BaseStat {
  int? baseStat;
  Stat? stat;
  BaseStat({this.baseStat, this.stat});

  factory BaseStat.fromJson(Map<String, dynamic> data) {
    Stat _stat = Stat.fromJson(data['stat']);

    return BaseStat(
      baseStat: data['base_stat'],
      stat: _stat,
    );
  }
}
