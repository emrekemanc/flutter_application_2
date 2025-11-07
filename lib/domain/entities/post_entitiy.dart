class PostEntitiy {
  final int id;
  final String title;
  final String body;

  PostEntitiy({required this.id, required this.title, required this.body});

  factory PostEntitiy.fromJson(Map<String, dynamic> json) =>
      PostEntitiy(id: json['id'], title: json['title'], body: json['']);
}
