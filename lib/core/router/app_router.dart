import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:cineverse/features/splash/presentation/pages/splash_page.dart';
import 'package:cineverse/features/auth/presentation/pages/onboarding_page.dart';
import 'package:cineverse/features/auth/presentation/pages/login_page.dart';
import 'package:cineverse/features/home/presentation/pages/home_page.dart';
import 'package:cineverse/features/main/presentation/pages/main_wrapper.dart';
import 'package:cineverse/features/movie_detail/presentation/pages/movie_detail_page.dart';
import 'package:cineverse/features/search/presentation/pages/search_page.dart';
import 'package:cineverse/features/watchlist/presentation/pages/watchlist_page.dart';

import 'package:cineverse/features/profile/presentation/pages/profile_page.dart';
import 'package:cineverse/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:cineverse/features/profile/presentation/pages/privacy_policy_page.dart';
import 'package:cineverse/features/profile/presentation/pages/terms_of_service_page.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: 'search',
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/watchlist',
                name: 'watchlist',
                builder: (context, state) => const WatchlistPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/movie/:id',
        name: 'movieDetail',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final movieId = int.parse(state.pathParameters['id']!);
          final posterPath = state.extra as String?;
          return CustomTransitionPage(
            key: state.pageKey,
            child: MovieDetailPage(movieId: movieId, posterPath: posterPath),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
            transitionDuration: const Duration(milliseconds: 300),
          );
        },
      ),
      GoRoute(
        path: '/privacy-policy',
        name: 'privacyPolicy',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: '/edit-profile',
        name: 'editProfile',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/terms-of-service',
        name: 'termsOfService',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const TermsOfServicePage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.matchedLocation}')),
    ),
  );
}
