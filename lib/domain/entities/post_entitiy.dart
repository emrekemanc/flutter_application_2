class PostEntitiy {
  PostEntitiy({required this.id, required this.title, required this.body});
  factory PostEntitiy.fromJson(Map<String, dynamic> json) => PostEntitiy(
    id: json['id'] as int,
    title: json['title'] as String,
    body: json[''] as String,
  );
  final int id;
  final String title;
  final String body;
}
