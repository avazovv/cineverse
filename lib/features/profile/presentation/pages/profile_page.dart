import 'dart:io';
import 'package:cineverse/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cineverse/core/settings/cubit/language_cubit.dart';
import 'package:cineverse/features/profile/data/profile_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:cineverse/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _appVersion = '';
  String? _profileImagePath;
  String? _savedFirstName;
  String? _savedLastName;
  String? _savedEmail;

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
    _loadProfileData();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _appVersion = packageInfo.version;
      });
    }
  }

  Future<void> _loadProfileData() async {
    final imagePath = await ProfileStorage.getProfileImagePath();
    final firstName = await ProfileStorage.getFirstName();
    final lastName = await ProfileStorage.getLastName();
    final email = await ProfileStorage.getEmail();

    if (mounted) {
      setState(() {
        _profileImagePath = imagePath;
        _savedFirstName = firstName;
        _savedLastName = lastName;
        _savedEmail = email;
      });
    }
  }

  Future<void> _navigateToEditProfile() async {
    await context.push('/edit-profile');
    await _loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          l10n.profileTitle,
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildUserInfoCard(state, l10n),
                const SizedBox(height: 24),
                _buildSettingsSection(context, l10n),
                const SizedBox(height: 24),
                _buildAboutSection(context, l10n),
                const SizedBox(height: 24),
                _buildLogoutButton(context, l10n),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserInfoCard(AuthState state, AppLocalizations l10n) {
    String userName;
    if (_savedFirstName != null || _savedLastName != null) {
      userName = '${_savedFirstName ?? ''} ${_savedLastName ?? ''}'.trim();
      if (userName.isEmpty) {
        userName = state is Authenticated
            ? (state.user.displayName ?? l10n.guestUser)
            : l10n.guestUser;
      }
    } else {
      userName = state is Authenticated
          ? (state.user.displayName ?? l10n.guestUser)
          : l10n.guestUser;
    }

    final userEmail =
        _savedEmail ??
        (state is Authenticated ? state.user.email : l10n.guestEmail);

    return GestureDetector(
      onTap: _navigateToEditProfile,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFE50914),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white12, width: 2),
              ),
              child: ClipOval(
                child:
                    _profileImagePath != null &&
                        File(_profileImagePath!).existsSync()
                    ? Image.file(
                        File(_profileImagePath!),
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Text(
                              userName.isNotEmpty
                                  ? userName[0].toUpperCase()
                                  : 'G',
                              style: GoogleFonts.outfit(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          userName.isNotEmpty ? userName[0].toUpperCase() : 'G',
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userEmail,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              l10n.settingsTitle,
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          _buildSettingsItem(
            icon: CupertinoIcons.globe,
            title: l10n.languageTitle,
            onTap: () => _showLanguageBottomSheet(context),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Localizations.localeOf(context).languageCode.toUpperCase(),
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  CupertinoIcons.chevron_right,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          _buildDivider(),
          _buildSettingsItem(
            icon: CupertinoIcons.bell_fill,
            title: l10n.notificationsTitle,
            trailing: CupertinoSwitch(
              value: false,
              activeColor: const Color(0xFFE50914),
              onChanged: (value) {
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              l10n.aboutTitle,
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          _buildAboutItem(
            icon: CupertinoIcons.info_circle_fill,
            title: l10n.appVersionTitle,
            subtitle: _appVersion.isNotEmpty ? _appVersion : '1.0.0',
          ),
          _buildDivider(),
          _buildAboutItem(
            icon: CupertinoIcons.person_fill,
            title: l10n.developerTitle,
            subtitle: 'Avazov Samandar',
          ),
          _buildDivider(),
          _buildAboutItem(
            icon: CupertinoIcons.film_fill,
            title: l10n.dataSourceTitle,
            subtitle: 'Powered by TMDb API',
          ),
          _buildDivider(),
          _buildSettingsItem(
            icon: CupertinoIcons.doc_text_fill,
            title: l10n.privacyPolicyTitle,
            onTap: () => context.push('/privacy-policy'),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              size: 16,
              color: Colors.grey,
            ),
          ),
          _buildDivider(),
          _buildSettingsItem(
            icon: CupertinoIcons.checkmark_shield_fill,
            title: l10n.termsOfServiceTitle,
            onTap: () => context.push('/terms-of-service'),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              size: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFE50914), size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.outfit(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildAboutItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFE50914), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: const Color(0xFF2A2A2A),
      height: 1,
      indent: 50,
      endIndent: 16,
    );
  }

  Widget _buildLogoutButton(BuildContext context, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _showLogoutDialog(context, l10n);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE50914),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.arrow_right_square, size: 20),
            const SizedBox(width: 8),
            Text(
              l10n.logoutButton,
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AppLocalizations l10n) {
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(l10n.logoutDialogTitle),
        content: Text(l10n.logoutDialogContent),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancelButton),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(SignOutEvent());
            },
            child: Text(l10n.logoutButton),
          ),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              _buildLanguageOption(context, 'English', 'en'),
              _buildLanguageOption(context, 'Русский', 'ru'),
              _buildLanguageOption(context, 'O\'zbek', 'uz'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(BuildContext context, String name, String code) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    final isSelected = currentLocale == code;

    return ListTile(
      onTap: () {
        context.read<LanguageCubit>().changeLanguage(code);
        Navigator.pop(context);
      },
      title: Text(
        name,
        style: GoogleFonts.outfit(
          color: isSelected ? const Color(0xFFE50914) : Colors.white,
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? const Icon(CupertinoIcons.checkmark, color: Color(0xFFE50914))
          : null,
    );
  }
}
