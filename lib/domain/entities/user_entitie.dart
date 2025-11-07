import 'dart:developer';
import 'package:flutter/foundation.dart';

class UserEntitie {
  final int id;
  final String name;
  final String job;

  UserEntitie({required this.id, required this.name, required this.job});

  factory UserEntitie.fromJson(Map<String, dynamic> json) =>
      UserEntitie(id: json['id'], name: json['name'], job: json['job']);
}
