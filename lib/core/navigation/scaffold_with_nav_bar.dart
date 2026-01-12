import 'package:flutter/material.dart';
import 'package:texa_core/core/widgets/nav_bars/bottom_nav_bar.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child, bottomNavigationBar: BottomNavBar());
  }
}
