import 'package:flutter/material.dart';

class ProfileListScreen extends StatelessWidget {
  final int locationId;

  ProfileListScreen({required this.locationId});

  final Map<int, List<Map<String, dynamic>>> profilesData = {
    1: [
      {'id': 1, 'name': '사용자1', 'age': 29},
      {'id': 2, 'name': '사용자2', 'age': 34},
    ],
    2: [
      {'id': 3, 'name': '사용자3', 'age': 25},
      {'id': 4, 'name': '사용자4', 'age': 31},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final profiles = profilesData[locationId] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 리스트'),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ListTile(
            title: Text(profile['name']),
            subtitle: Text('나이: ${profile['age']}'),
          );
        },
      ),
    );
  }
}