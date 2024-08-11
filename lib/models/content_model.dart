class ContentModel {
    int id;
    String title;
    String thumbnail;
    DateTime createdAt;

    ContentModel({
        required this.id,
        required this.title,
        required this.thumbnail,
        required this.createdAt,
    });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
