import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texa_core/core/di/injection.dart';
import 'package:texa_core/core/theme/app_theme.dart';
import 'package:texa_core/core/theme/theme_cubit/theme_cubit.dart';
import 'package:texa_core/features/home/theme_test_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<ThemeCubit>())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          themeMode: themeMode,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          home: ThemeTestPage(),
        );
      },
    );
  }
}
