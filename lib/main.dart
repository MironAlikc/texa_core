import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texa_core/core/di/injection.dart';
import 'package:texa_core/core/l10n/gen/app_localizations.dart';
import 'package:texa_core/core/l10n/locale_cubit/locale_cubit.dart';
import 'package:texa_core/core/navigation/app_router.dart';
import 'package:texa_core/core/theme/app_theme.dart';
import 'package:texa_core/core/theme/theme_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(create: (_) => getIt<LocaleCubit>()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, currentLocale) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context).appName,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              locale: currentLocale,
              themeMode: themeMode,
              theme: AppTheme.light(),
              darkTheme: AppTheme.dark(),
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
