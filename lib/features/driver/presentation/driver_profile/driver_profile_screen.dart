import 'package:flutter/material.dart';
import 'package:texa_core/core/navigation/routes_provider.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Screen'),
            ElevatedButton(
              onPressed: () => context.goToSettings(),
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
