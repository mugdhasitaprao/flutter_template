import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/joke_details_entity.dart';

part 'joke_details_response_entity.g.dart';

@JsonSerializable()
class JokeDetailsResponseEntity
    implements
        BaseLayerDataTransformer<JokeDetailsResponseEntity, JokeDetails> {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "error")
  final bool error;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "setup")
  final String setup;
  @JsonKey(name: "delivery")
  final String delivery;
  @JsonKey(name: "safe")
  final bool safe;
  @JsonKey(name: "lang")
  final String lang;
  @JsonKey(name: "joke")
  final String joke;

  JokeDetailsResponseEntity(this.id, this.error, this.category, this.type,
      this.safe, this.lang,{this.setup = '',this.joke='',this.delivery=''});

  factory JokeDetailsResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$JokeDetailsResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JokeDetailsResponseEntityToJson(this);

  @override
  JokeDetailsResponseEntity restore(JokeDetails data) {
    throw UnimplementedError();
  }

  @override
  JokeDetails transform() {
    return JokeDetails(
        id: id,
        type: type,
        safe: safe,
        lang: lang,
        error: error,
        category: category,
        setup: setup ,
        delivery: delivery,
        joke: joke );
  }
}
