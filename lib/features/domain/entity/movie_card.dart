// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieCard {
  String name;
  String id;
  String releaseYear;
  String overview;
  String posterUrl;
  MovieCard({
    required this.name,
    required this.id,
    required this.releaseYear,
    required this.overview,
    required this.posterUrl,
  });

  factory MovieCard.fromMap(Map<String, dynamic> map) {
    return MovieCard(
      name: map['title'] as String,
      id: map['id'] as String,
      releaseYear: map['releaseYear'] as String,
      overview: map['overview'] as String,
      posterUrl: map['posterUrl'] as String,
    );
  }

  factory MovieCard.fromJson(Map<String, dynamic> json) =>
      MovieCard.fromMap(json);
}
