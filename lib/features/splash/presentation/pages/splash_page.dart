import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('is_first_time') ?? true;
    final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;

    if (isFirstTime) {
      context.go('/onboarding');
    } else {
      if (isLoggedIn) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/splash.json',
              width: 250,
              height: 250,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.movie_filter_rounded,
                  size: 100,
                  color: Color(0xFFE50914),
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              'CINEVERSE',
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFE50914),
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
