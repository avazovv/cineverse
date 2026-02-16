import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';


class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get profileTitle => 'Профиль';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get languageTitle => 'Язык';

  @override
  String get darkModeTitle => 'Темная тема';

  @override
  String get notificationsTitle => 'Уведомления';

  @override
  String get aboutTitle => 'О приложении';

  @override
  String get appVersionTitle => 'Версия приложения';

  @override
  String get developerTitle => 'Разработчик';

  @override
  String get dataSourceTitle => 'Источник данных';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get termsOfServiceTitle => 'Условия использования';

  @override
  String get logoutButton => 'Выйти';

  @override
  String get logoutDialogTitle => 'Выход';

  @override
  String get logoutDialogContent => 'Вы уверены, что хотите выйти?';

  @override
  String get cancelButton => 'Отмена';

  @override
  String get guestUser => 'Гость';

  @override
  String get guestEmail => 'guest@cineverse.app';
}
