// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

//   class ScaffoldWithNavBar extends StatefulWidget {
//     final Widget child;
//     final Widget navBar;

//     const ScaffoldWithNavBar({
//       super.key,
//       required this.child,
//       required this.navBar,
//     });

//     // @override
//     State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
//   }

//   class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar>
//       with RouteAware {
//     @override
//     void didChangeDependencies() {
//       super.didChangeDependencies();
//       // Принудительно слушаем изменения
//       final router = GoRouter.of(context);
//       router.routeInformationProvider.addListener(_rebuild);
//     }

//     @override
//     void dispose() {
//       try {
//         final router = GoRouter.of(context);
//         router.routeInformationProvider.removeListener(_rebuild);
//       } catch (_) {}
//       super.dispose();
//     }

//     void _rebuild() {
//       if (mounted) {
//         setState(() {});
//       }
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         backgroundColor: Colors.transparent,
//         body: widget.child,
//         bottomNavigationBar: widget.navBar,
//       );
//     }
//   }

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: child,
      bottomNavigationBar: navBar,
    );
  }
}
