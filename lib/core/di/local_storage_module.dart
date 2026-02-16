import 'package:cineverse/features/watchlist/data/models/watchlist_movie_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class LocalStorageModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<Box> get watchlistBox async {
    await Hive.initFlutter();
    Hive.registerAdapter(WatchlistMovieModelAdapter());
    return await Hive.openBox('watchlist');
  }
}
