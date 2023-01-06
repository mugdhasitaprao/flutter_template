class JokeDetails {
  final bool error;
  final String category;
  final String type;
  final String setup;
  final String delivery;
  final int id;
  final bool safe;
  final String lang;
  final String joke;

  JokeDetails(
      {this.error = false,
      this.category = "",
      this.type = "",
      this.setup = "",
      this.delivery = "",
      this.id = -1,
      this.safe = true,
      this.lang = '',
      this.joke =''});
}
