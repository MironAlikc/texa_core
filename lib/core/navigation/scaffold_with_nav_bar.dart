import 'package:flutter/material.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  final Widget navBar;

  const ScaffoldWithNavBar({
    super.key,
    required this.child,
    required this.navBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child, bottomNavigationBar: navBar);
  }
}
