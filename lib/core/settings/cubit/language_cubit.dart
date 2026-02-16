import 'package:cineverse/core/settings/cubit/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences _prefs;

  LanguageCubit(this._prefs) : super(const LanguageState(Locale('en'))) {
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() {
    final languageCode = _prefs.getString('language_code');
    if (languageCode != null) {
      emit(LanguageState(Locale(languageCode)));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString('language_code', languageCode);
    emit(LanguageState(Locale(languageCode)));
  }
}
