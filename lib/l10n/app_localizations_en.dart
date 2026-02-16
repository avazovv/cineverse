import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';


class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get profileTitle => 'Profile';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get languageTitle => 'Language';

  @override
  String get darkModeTitle => 'Dark Mode';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get aboutTitle => 'About';

  @override
  String get appVersionTitle => 'App Version';

  @override
  String get developerTitle => 'Developer';

  @override
  String get dataSourceTitle => 'Data Source';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get termsOfServiceTitle => 'Terms of Service';

  @override
  String get logoutButton => 'Logout';

  @override
  String get logoutDialogTitle => 'Logout';

  @override
  String get logoutDialogContent => 'Are you sure you want to logout?';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get guestUser => 'Guest User';

  @override
  String get guestEmail => 'guest@cineverse.app';
}
