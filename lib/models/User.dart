class User {
  String id;
  final String name;
  final int quizzCount;

  User(this.id, this.name, this.quizzCount);

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'quizzCount': quizzCount
      };

  static User fromJson(Map<String, dynamic> json) =>
      User(
          json["id"],
          json["name"],
          json["quizzCount"]
      );
}