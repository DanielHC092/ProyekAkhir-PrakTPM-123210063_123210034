class Movie {
  final String? title;
  final String? year;
  final String? rated;
  final String? genre;
  final String? poster;
  final String? runtime;
  final String? release;
  final String? plot;
  final String? actors;
  final String? rating;
  final String? award;

  Movie({
    this.title,
    this.year,
    this.rated,
    this.genre,
    this.poster,
    this.release,
    this.runtime,
    this.plot,
    this.actors,
    this.rating,
    this.award,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['Title'] as String?,
        year = json['Year'] as String?,
        rated = json['Rated'] as String?,
        genre = json['Genre'] as String?,
        poster = json['Poster'] as String?,
        runtime = json['Runtime'] as String?,
        release = json['Released'] as String?,
        plot = json['Plot'] as String?,
        actors = json['Actors'] as String?,
        rating = json['Rating'] as String?,
        award = json['Award'] as String?;

  Map<String, dynamic> toJson() => {
        'Title': title,
        'Year': year,
        'Rated': rated,
        'Genre': genre,
        'Poster': poster,
        'Runtime': runtime,
        'Released': release,
        'Plot': plot,
        'Actors': actors,
        'Rating': rating,
        'Award': award,
      };
}
