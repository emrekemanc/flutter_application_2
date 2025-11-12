class UserEntitiy {
  UserEntitiy({required this.id, required this.name, required this.job});

  factory UserEntitiy.fromJson(Map<String, dynamic> json) => UserEntitiy(
    id: json['id'] as String,
    name: json['name'] as String,
    job: json['job'] as String,
  );
  final String id;
  final String name;
  final String job;
}
