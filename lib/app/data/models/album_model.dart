class AlbumModel {
  final userId;
  final id;
  final title;

  AlbumModel({this.userId, this.id, this.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }
}
