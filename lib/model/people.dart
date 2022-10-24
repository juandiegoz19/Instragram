import 'dart:convert';

People peopleFromJson(String str) => People.fromJson(json.decode(str));

String peopleToJson(People data) => json.encode(data.toJson());

class People {
    People({
        required this.totalResults,
        required this.page,
        required this.perPage,
        required this.photos,
        required this.nextPage,
    });

    int totalResults;
    int page;
    int perPage;
    List<Photo> photos;
    String nextPage;

    factory People.fromJson(Map<String, dynamic> json) => People(
        totalResults: json["total_results"],
        page: json["page"],
        perPage: json["per_page"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        nextPage: json["next_page"],
    );

    Map<String, dynamic> toJson() => {
        "total_results": totalResults,
        "page": page,
        "per_page": perPage,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "next_page": nextPage,
    };
}

class Photo {
    Photo({
        required this.id,
        required this.width,
        required this.height,
        required this.url,
        required this.photographer,
        required this.photographerUrl,
        required this.photographerId,
        required this.avgColor,
        required this.src,
        required this.alt,
    });

    int id;
    int width;
    int height;
    String url;
    String photographer;
    String photographerUrl;
    int photographerId;
    String avgColor;
    Src src;
    String alt;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: Src.fromJson(json["src"]),
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toJson(),
        "alt": alt,
    };
}

class Src {
    Src({
        required this.original,
        required this.large2X,
        required this.large,
        required this.medium,
        required this.small,
        required this.portrait,
        required this.landscape,
        required this.tiny, 
        this.liked = true,
    });

    String original;
    String large2X;
    String large;
    String medium;
    String small;
    String portrait;
    String landscape;
    String tiny;
    bool liked;

    factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
    );

    Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
    };
}
