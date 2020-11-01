import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.category,
  });

  List<Category> category;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.albumcategory,
    this.photo,
    this.captions,
  });

  Albumcategory albumcategory;
  String photo;
  String captions;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    albumcategory: albumcategoryValues.map[json["albumcategory"]],
    photo: json["photo"],
    captions: json["captions"],
  );

  Map<String, dynamic> toJson() => {
    "albumcategory": albumcategoryValues.reverse[albumcategory],
    "photo": photo,
    "captions": captions,
  };
}

enum Albumcategory { WEDDING }

final albumcategoryValues = EnumValues({
  "wedding": Albumcategory.WEDDING
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
