class Result {
  String name;
  String url;
  int? id;

  Result({
    required this.name,
    required this.url,
    this.id,
  });

  Result copyWith({
    String? name,
    String? url,
  }) =>
      Result(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
        id: int.parse(json["url"].split('/').reversed.elementAt(1)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
