import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_coordinator.dart';
import 'package:flutter_application_2/custom_button.dart';

class ListPageView extends StatelessWidget {
  final appcoordinator = Appcoordinator();
  ListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page View'),
        actions: [
          CustomIconButton(
            icon: Icons.home,

            onPressed: () {
              appcoordinator.navigateToMain();
            },
          ),
        ],
      ),
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
