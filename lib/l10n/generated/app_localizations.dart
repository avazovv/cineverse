import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @darkModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkModeTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @appVersionTitle.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get appVersionTitle;

  /// No description provided for @developerTitle.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developerTitle;

  /// No description provided for @dataSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Source'**
  String get dataSourceTitle;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @termsOfServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceTitle;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @logoutDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutDialogTitle;

  /// No description provided for @logoutDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutDialogContent;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @guestUser.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guestUser;

  /// No description provided for @guestEmail.
  ///
  /// In en, this message translates to:
  /// **'guest@cineverse.app'**
  String get guestEmail;

  /// No description provided for @homeNav.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNav;

  /// No description provided for @searchNav.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchNav;

  /// No description provided for @watchlistNav.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get watchlistNav;

  /// No description provided for @profileNav.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileNav;

  /// No description provided for @trendingNow.
  ///
  /// In en, this message translates to:
  /// **'🔥 Trending Now'**
  String get trendingNow;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'⭐ Popular'**
  String get popular;

  /// No description provided for @topRated.
  ///
  /// In en, this message translates to:
  /// **'🏆 Top Rated'**
  String get topRated;

  /// No description provided for @nowPlaying.
  ///
  /// In en, this message translates to:
  /// **'🎬 Now Playing'**
  String get nowPlaying;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for movies...'**
  String get searchHint;

  /// No description provided for @noMoviesFound.
  ///
  /// In en, this message translates to:
  /// **'No movies found'**
  String get noMoviesFound;

  /// No description provided for @startSearching.
  ///
  /// In en, this message translates to:
  /// **'Find your next favorite movie'**
  String get startSearching;

  /// No description provided for @searchError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get searchError;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @watchlistTitle.
  ///
  /// In en, this message translates to:
  /// **'My Watchlist'**
  String get watchlistTitle;

  /// No description provided for @watchlistEmpty.
  ///
  /// In en, this message translates to:
  /// **'No movies in your watchlist yet'**
  String get watchlistEmpty;

  /// No description provided for @watchlistEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add movies from search or detail page'**
  String get watchlistEmptySubtitle;

  /// No description provided for @termsOfServiceText.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service for CineVerse\n\nLast updated: February 15, 2026\n\n1. Agreement to Terms\nBy accessing or using our application, you agree to be bound by these Terms of Service and our Privacy Policy.\n\n2. Intellectual Property Rights\nCineVerse and/or its licensors own all the intellectual property rights and materials contained in this Application.\n\n3. Restrictions\nYou are restricted from selling, sublicensing and/or otherwise commercializing any Application material.\n\n4. User Content\nYour Content shall mean any audio, video text, images or other material you choose to display on this Application.\n\n5. No Warranties\nThis Application is provided \"as is,\" with all faults.\n\n6. Limitation of Liability\nIn no event shall CineVerse be held liable for anything arising out of or in any way connected with your use of this Application.\n\n7. Governing Law & Jurisdiction\nThese Terms will be governed by and interpreted in accordance with the laws of the State of Uzbekistan.'**
  String get termsOfServiceText;

  /// No description provided for @privacyPolicyText.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy for CineVerse\n\nLast updated: February 15, 2026\n\n1. Introduction\nWelcome to CineVerse. We respect your privacy and are committed to protecting your personal data.\n\n2. Data We Collect\nWe may collect Identity Data, Contact Data, Technical Data, and Profile Data.\n\n3. How We Use Your Data\nWe will only use your personal data when the law allows us to.\n\n4. Data Security\nWe have put in place appropriate security measures to prevent your personal data from being accidentally lost, used or accessed in an unauthorized way.\n\n5. Your Legal Rights\nYou have rights under data protection laws in relation to your personal data.\n\n6. Contact Us\nIf you have any questions, please contact us at: support@cineverse.app'**
  String get privacyPolicyText;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginTitle;

  /// No description provided for @signInGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInGoogle;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Entertainment'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Discover thousands of movies, TV shows, and more.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Watch Anywhere'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Stream on your phone, tablet, laptop, and TV without paying more.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Create Profiles'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Sign in to access your personalized recommendations.'**
  String get onboardingDesc3;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @editProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileTitle;

  /// No description provided for @firstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstNameLabel;

  /// No description provided for @lastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastNameLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @saveChangesButton.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesButton;

  /// No description provided for @choosePhotoOption.
  ///
  /// In en, this message translates to:
  /// **'Choose Photo'**
  String get choosePhotoOption;

  /// No description provided for @takePhotoOption.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhotoOption;

  /// No description provided for @removePhotoOption.
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get removePhotoOption;

  /// No description provided for @selectPhotoSource.
  ///
  /// In en, this message translates to:
  /// **'Select Photo Source'**
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
  // Lookup logic when only language code is specified.
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
