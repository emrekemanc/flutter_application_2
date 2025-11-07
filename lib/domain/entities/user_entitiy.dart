class UserEntitiy {
  final String id;
  final String name;
  final String job;

  UserEntitiy({required this.id, required this.name, required this.job});

  factory UserEntitiy.fromJson(Map<String, dynamic> json) =>
      UserEntitiy(id: json['id'], name: json['name'], job: json['job']);
}
