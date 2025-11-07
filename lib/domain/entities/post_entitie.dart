class PostEntitie {
  final int id;
  final String title;
  final String body;

  PostEntitie({required this.id, required this.title, required this.body});

  factory PostEntitie.fromJson(Map<String, dynamic> json) =>
      PostEntitie(id: json['id'], title: json['title'], body: json['']);
}
