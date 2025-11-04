import 'package:flutter/material.dart';

class ListPageView extends StatelessWidget {
  const ListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Page View')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text('Item ${index + 1}'),
          );
        },
      ),
    );
  }
}
