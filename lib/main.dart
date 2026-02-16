import 'package:cineverse/core/di/injection.dart';
import 'package:cineverse/core/router/app_router.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:cineverse/core/settings/cubit/language_cubit.dart';
import 'package:cineverse/core/settings/cubit/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cineverse/l10n/generated/app_localizations.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureDependencies();
  runApp(const CineVerseApp());
}

class CineVerseApp extends StatelessWidget {
  const CineVerseApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(CheckAuthStatus()),
        ),
        BlocProvider(create: (context) => getIt<WatchlistBloc>()),
        BlocProvider(create: (context) => getIt<LanguageCubit>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            AppRouter.router.go('/login');
          }
        },
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, languageState) {
            return MaterialApp.router(
              title: 'CineVerse',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              darkTheme: AppTheme.darkTheme(),
              themeMode: ThemeMode.dark,
              locale: languageState.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ru'),
                Locale('uz'),
              ],
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
