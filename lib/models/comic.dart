class Comic {
  List<dynamic>? aliases;
  String apiDetailUrl;
  String? coverDate;
  String dateAdded;
  String? dateLastUpdate;
  String? deck;
  String? description;
  bool hasStaffReview;
  num id;
  ComicImage image;
  AssociatedImages? associatedImages;
  String issueNumber;
  String? name;
  String? siteDetailUrl;
  String? storeDate;
  Volume volume;

  Comic({
    this.aliases,
    required this.apiDetailUrl,
    this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdate,
    this.deck,
    this.description,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    this.associatedImages,
    required this.issueNumber,
    this.name,
    required this.siteDetailUrl,
    this.storeDate,
    required this.volume,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      id: json["id"],
      issueNumber: json["issue_number"],
      hasStaffReview: json["has_staff_review"],
      dateLastUpdate: json["date_last_update"],
      siteDetailUrl: json["side_detail_url"],
      deck: json["deck"],
      apiDetailUrl: json["api_detail_url"],
      coverDate: json["cover_date"],
      dateAdded: json["date_added"],
      volume: Volume.fromJson(json["volume"]),
      storeDate: json["store_date"],
      description: json["description"],
      name: json["name"],
      aliases: json["aliases"],
      image: ComicImage.fromJson(json["image"]),
    );
  }
}

class ComicListResponse {
  List<Comic> comicsList;

  ComicListResponse({required this.comicsList});

  factory ComicListResponse.fromJson(dynamic json) {
    return ComicListResponse(
        comicsList: (json as List<dynamic>?)
                ?.map((e) => Comic.fromJson(e as dynamic))
                .toList() ??
            []);
  }
}

class Volume {
  String? name;

  Volume({this.name});

  factory Volume.fromJson(dynamic json) {
    return Volume(name: json["name"]);
  }
}

class ComicImage {
  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  String? imageTags;

  ComicImage({
    this.iconUrl,
    this.imageTags,
    this.mediumUrl,
    this.originalUrl,
    this.screenLargeUrl,
    this.screenUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
  });

  factory ComicImage.fromJson(dynamic json) {
    return ComicImage(
      iconUrl: json["icon_url"],
      mediumUrl: json["medium_url"],
      screenUrl: json["screen_url"],
      screenLargeUrl: json["screen_large_url"],
      smallUrl: json["small_url"],
      superUrl: json["super_url"],
      thumbUrl: json["thumb_url"],
      tinyUrl: json["tiny_url"],
      originalUrl: json["original_url"],
      imageTags: json["image_tags"],
    );
  }
}

class AssociatedImages {
  dynamic originalUrl;
  dynamic id;
  dynamic caption;
  dynamic imageTags;

  AssociatedImages({this.originalUrl, this.imageTags, this.id, this.caption});

  factory AssociatedImages.fromJson(dynamic json) {
    return AssociatedImages(
      id: json["id"],
      caption: json["caption"],
      imageTags: json["image_tags"],
    );
  }
}
