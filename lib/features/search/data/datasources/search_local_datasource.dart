import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SearchLocalDataSource {
  Future<List<String>> getSearchHistory();
  Future<void> saveSearchQuery(String query);
  Future<void> deleteSearchQuery(String query);
  Future<void> clearSearchHistory();
}

@LazySingleton(as: SearchLocalDataSource)
class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _kSearchHistoryKey = 'search_history';

  SearchLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<String>> getSearchHistory() async {
    return sharedPreferences.getStringList(_kSearchHistoryKey) ?? [];
  }

  @override
  Future<void> saveSearchQuery(String query) async {
    List<String> history = await getSearchHistory();
    history.remove(query);
    history.insert(0, query);
    if (history.length > 10) {
      history = history.sublist(0, 10);
    }
    await sharedPreferences.setStringList(_kSearchHistoryKey, history);
  }

  @override
  Future<void> deleteSearchQuery(String query) async {
    List<String> history = await getSearchHistory();
    history.remove(query);
    await sharedPreferences.setStringList(_kSearchHistoryKey, history);
  }

  @override
  Future<void> clearSearchHistory() async {
    await sharedPreferences.remove(_kSearchHistoryKey);
  }
}
