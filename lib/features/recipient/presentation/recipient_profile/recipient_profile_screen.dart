import 'package:flutter/material.dart';

class RecipientProfileScreen extends StatelessWidget {
  const RecipientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipient Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Recipient Profile Screen')],
        ),
      ),
    );
  }
}
