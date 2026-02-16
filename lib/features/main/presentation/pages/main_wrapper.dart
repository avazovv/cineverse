import 'package:cineverse/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapper({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF2A2A2A), width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          backgroundColor: const Color(0xFF0D0D0D),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: GoogleFonts.outfit(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.outfit(fontSize: 11),
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.house_fill),
              label: l10n.homeNav,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.search),
              label: l10n.searchNav,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.bookmark),
              label: l10n.watchlistNav,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.person),
              label: l10n.profileNav,
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
