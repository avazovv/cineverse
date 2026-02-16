import 'package:flutter/material.dart';
import 'package:cineverse/l10n/generated/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          l10n.privacyPolicyTitle,
          style: GoogleFonts.outfit(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          l10n.privacyPolicyText,
          style: GoogleFonts.outfit(color: Colors.white70, fontSize: 16),
        ),
      ),
    );
  }
}
