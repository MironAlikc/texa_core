import 'package:flutter/material.dart';

class ManagerSettingsScreen extends StatelessWidget {
  const ManagerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manager Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Manager Settings Screen')],
        ),
      ),
    );
  }
}
