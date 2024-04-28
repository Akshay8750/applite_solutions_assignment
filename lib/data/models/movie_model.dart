class MovieModel {
  MovieModel({
    required this.score,
    required this.show,
  });

  final num score;
  final Show? show;

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
      score: json["score"] ?? 0,
      show: json["show"] == null ? null : Show.fromJson(json["show"]),
    );
  }

}

class Show {
  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final num runtime;
  final num averageRuntime;
  final String premiered;
  final DateTime? ended;
  final String officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final num weight;
  final Network? network;
  final Network? webChannel;
  final dynamic dvdCountry;
  final Externals? externals;
  final Image? image;
  final String summary;
  final num updated;
  final Links? links;

  factory Show.fromJson(Map<String, dynamic> json){
    return Show(
      id: json["id"] ?? 0,
      url: json["url"] ?? "",
      name: json["name"] ?? "",
      type: json["type"] ?? "",
      language: json["language"] ?? "",
      genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
      status: json["status"] ?? "",
      runtime: json["runtime"] ?? 0,
      averageRuntime: json["averageRuntime"] ?? 0,
      premiered: json["premiered"] ?? "",
      ended: DateTime.tryParse(json["ended"] ?? ""),
      officialSite: json["officialSite"] ?? "",
      schedule: json["schedule"] == null ? null : Schedule.fromJson(json["schedule"]),
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      weight: json["weight"] ?? 0,
      network: json["network"] == null ? null : Network.fromJson(json["network"]),
      webChannel: json["webChannel"] == null ? null : Network.fromJson(json["webChannel"]),
      dvdCountry: json["dvdCountry"],
      externals: json["externals"] == null ? null : Externals.fromJson(json["externals"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      summary: json["summary"] ?? "",
      updated: json["updated"] ?? 0,
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

}

class Externals {
  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  final num tvrage;
  final num thetvdb;
  final String imdb;

  factory Externals.fromJson(Map<String, dynamic> json){
    return Externals(
      tvrage: json["tvrage"] ?? 0,
      thetvdb: json["thetvdb"] ?? 0,
      imdb: json["imdb"] ?? "",
    );
  }

}

class Image {
  Image({
    required this.medium,
    required this.original,
  });

  final String medium;
  final String original;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      medium: json["medium"] ?? "",
      original: json["original"] ?? "",
    );
  }

}

class Links {
  Links({
    required this.self,
    required this.previousepisode,
  });

  final Self? self;
  final Previousepisode? previousepisode;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      self: json["self"] == null ? null : Self.fromJson(json["self"]),
      previousepisode: json["previousepisode"] == null ? null : Previousepisode.fromJson(json["previousepisode"]),
    );
  }

}

class Previousepisode {
  Previousepisode({
    required this.href,
    required this.name,
  });

  final String href;
  final String name;

  factory Previousepisode.fromJson(Map<String, dynamic> json){
    return Previousepisode(
      href: json["href"] ?? "",
      name: json["name"] ?? "",
    );
  }

}

class Self {
  Self({
    required this.href,
  });

  final String href;

  factory Self.fromJson(Map<String, dynamic> json){
    return Self(
      href: json["href"] ?? "",
    );
  }

}

class Network {
  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  final int id;
  final String name;
  final Country? country;
  final String officialSite;

  factory Network.fromJson(Map<String, dynamic> json){
    return Network(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      country: json["country"] == null ? null : Country.fromJson(json["country"]),
      officialSite: json["officialSite"] ?? "",
    );
  }

}

class Country {
  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  final String name;
  final String code;
  final String timezone;

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      name: json["name"] ?? "",
      code: json["code"] ?? "",
      timezone: json["timezone"] ?? "",
    );
  }

}

class Rating {
  Rating({
    required this.average,
  });

  final num average;

  factory Rating.fromJson(Map<String, dynamic> json){
    return Rating(
      average: json["average"] ?? 0,
    );
  }

}

class Schedule {
  Schedule({
    required this.time,
    required this.days,
  });

  final String time;
  final List<String> days;

  factory Schedule.fromJson(Map<String, dynamic> json){
    return Schedule(
      time: json["time"] ?? "",
      days: json["days"] == null ? [] : List<String>.from(json["days"]!.map((x) => x)),
    );
  }

}
