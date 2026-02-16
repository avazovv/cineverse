import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';


abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  String get profileTitle;

  String get settingsTitle;

  String get languageTitle;

  String get darkModeTitle;

  String get notificationsTitle;

  String get aboutTitle;

  String get appVersionTitle;

  String get developerTitle;

  String get dataSourceTitle;

  String get privacyPolicyTitle;

  String get termsOfServiceTitle;

  String get logoutButton;

  String get logoutDialogTitle;

  String get logoutDialogContent;

  String get cancelButton;

  String get guestUser;

  String get guestEmail;

  String get homeNav;

  String get searchNav;

  String get watchlistNav;

  String get profileNav;

  String get trendingNow;

  String get popular;

  String get topRated;

  String get nowPlaying;

  String get searchHint;

  String get noMoviesFound;

  String get startSearching;

  String get searchError;

  String get tryAgain;

  String get watchlistTitle;

  String get watchlistEmpty;

  String get watchlistEmptySubtitle;

  String get termsOfServiceText;

  String get privacyPolicyText;

  String get loginTitle;

  String get signInGoogle;

  String get onboardingTitle1;

  String get onboardingDesc1;

  String get onboardingTitle2;

  String get onboardingDesc2;

  String get onboardingTitle3;

  String get onboardingDesc3;

  String get getStarted;

  String get next;

  String get skip;

  String get editProfileTitle;

  String get firstNameLabel;

  String get lastNameLabel;

  String get emailLabel;

  String get saveChangesButton;

  String get choosePhotoOption;

  String get takePhotoOption;

  String get removePhotoOption;

  String get selectPhotoSource;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
