import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_details_entity.g.dart';

@JsonSerializable()
class JokeDetailEntity
    implements BaseLayerDataTransformer<JokeDetailEntity, JokeDetails> {
  final bool error;
  final String category;
  final String type;
  final String setup;
  final String delivery;
  final int id;
  final bool safe;
  final String lang;

  JokeDetailEntity(this.error, this.category, this.type, this.setup,
      this.delivery, this.id, this.safe, this.lang);

  factory JokeDetailEntity.fromJson(Map<String, dynamic> json) {
    return _$JokeDetailEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JokeDetailEntityToJson(this);

  @override
  JokeDetailEntity restore(JokeDetails data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  JokeDetails transform() {
    return JokeDetails(
        category: category,
        delivery: delivery,
        error: error,
        lang: lang,
        safe: safe,
        setup: setup,
        type: type,
        id: id);
  }
}
