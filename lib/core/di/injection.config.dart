


import 'package:cineverse/core/di/home_module.dart' as _i922;
import 'package:cineverse/core/di/local_storage_module.dart' as _i389;
import 'package:cineverse/core/di/network_module.dart' as _i54;
import 'package:cineverse/core/network/dio_client.dart' as _i264;
import 'package:cineverse/core/settings/cubit/language_cubit.dart' as _i458;
import 'package:cineverse/features/auth/data/repositories/auth_repository_impl.dart'
    as _i508;
import 'package:cineverse/features/auth/domain/repositories/auth_repository.dart'
    as _i784;
import 'package:cineverse/features/auth/domain/usecases/get_auth_status_stream.dart'
    as _i438;
import 'package:cineverse/features/auth/domain/usecases/sign_in_with_google.dart'
    as _i313;
import 'package:cineverse/features/auth/domain/usecases/sign_out.dart'
    as _i1025;
import 'package:cineverse/features/auth/presentation/bloc/auth_bloc.dart'
    as _i1040;
import 'package:cineverse/features/home/data/datasources/movie_remote_datasource.dart'
    as _i965;
import 'package:cineverse/features/home/domain/repositories/movie_repository.dart'
    as _i283;
import 'package:cineverse/features/home/domain/usecases/get_movies.dart'
    as _i739;
import 'package:cineverse/features/home/presentation/bloc/home_bloc.dart'
    as _i843;
import 'package:cineverse/features/movie_detail/data/datasources/movie_detail_datasource.dart'
    as _i913;
import 'package:cineverse/features/movie_detail/data/repositories/movie_detail_repository_impl.dart'
    as _i478;
import 'package:cineverse/features/movie_detail/domain/repositories/movie_detail_repository.dart'
    as _i666;
import 'package:cineverse/features/movie_detail/domain/usecases/get_movie_cast.dart'
    as _i1013;
import 'package:cineverse/features/movie_detail/domain/usecases/get_movie_detail.dart'
    as _i216;
import 'package:cineverse/features/movie_detail/domain/usecases/get_similar_movies.dart'
    as _i880;
import 'package:cineverse/features/movie_detail/presentation/bloc/movie_detail_bloc.dart'
    as _i527;
import 'package:cineverse/features/search/data/datasources/search_datasource.dart'
    as _i800;
import 'package:cineverse/features/search/data/datasources/search_local_datasource.dart'
    as _i479;
import 'package:cineverse/features/search/data/repositories/search_repository_impl.dart'
    as _i1066;
import 'package:cineverse/features/search/domain/repositories/search_repository.dart'
    as _i317;
import 'package:cineverse/features/search/domain/usecases/search_history_usecases.dart'
    as _i1002;
import 'package:cineverse/features/search/domain/usecases/search_movies.dart'
    as _i8;
import 'package:cineverse/features/search/presentation/bloc/search_bloc.dart'
    as _i157;
import 'package:cineverse/features/watchlist/data/datasources/watchlist_local_datasource.dart'
    as _i836;
import 'package:cineverse/features/watchlist/data/repositories/watchlist_repository_impl.dart'
    as _i725;
import 'package:cineverse/features/watchlist/domain/repositories/watchlist_repository.dart'
    as _i940;
import 'package:cineverse/features/watchlist/domain/usecases/watchlist_usecases.dart'
    as _i781;
import 'package:cineverse/features/watchlist/presentation/bloc/watchlist_bloc.dart'
    as _i859;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localStorageModule = _$LocalStorageModule();
    final networkModule = _$NetworkModule();
    final homeModule = _$HomeModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => localStorageModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i986.Box<dynamic>>(
      () => localStorageModule.watchlistBox,
      preResolve: true,
    );
    gh.lazySingleton<_i264.DioClient>(() => networkModule.dioClient);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i458.LanguageCubit>(
        () => _i458.LanguageCubit(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i913.MovieDetailRemoteDataSource>(
        () => _i913.MovieDetailRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i836.WatchlistLocalDataSource>(
        () => _i836.WatchlistLocalDataSourceImpl(gh<_i979.Box<dynamic>>()));
    gh.lazySingleton<_i800.SearchRemoteDataSource>(
        () => _i800.SearchRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i965.MovieRemoteDataSource>(
        () => homeModule.movieRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i283.MovieRepository>(
        () => homeModule.movieRepository(gh<_i965.MovieRemoteDataSource>()));
    gh.lazySingleton<_i784.AuthRepository>(() => _i508.AuthRepositoryImpl());
    gh.lazySingleton<_i940.WatchlistRepository>(() =>
        _i725.WatchlistRepositoryImpl(gh<_i836.WatchlistLocalDataSource>()));
    gh.lazySingleton<_i666.MovieDetailRepository>(() =>
        _i478.MovieDetailRepositoryImpl(
            remoteDataSource: gh<_i913.MovieDetailRemoteDataSource>()));
    gh.lazySingleton<_i216.GetMovieDetail>(
        () => _i216.GetMovieDetail(gh<_i666.MovieDetailRepository>()));
    gh.lazySingleton<_i1013.GetMovieCast>(
        () => _i1013.GetMovieCast(gh<_i666.MovieDetailRepository>()));
    gh.lazySingleton<_i880.GetSimilarMovies>(
        () => _i880.GetSimilarMovies(gh<_i666.MovieDetailRepository>()));
    gh.lazySingleton<_i781.GetWatchlist>(
        () => _i781.GetWatchlist(gh<_i940.WatchlistRepository>()));
    gh.lazySingleton<_i781.AddToWatchlist>(
        () => _i781.AddToWatchlist(gh<_i940.WatchlistRepository>()));
    gh.lazySingleton<_i781.RemoveFromWatchlist>(
        () => _i781.RemoveFromWatchlist(gh<_i940.WatchlistRepository>()));
    gh.lazySingleton<_i781.CheckWatchlistStatus>(
        () => _i781.CheckWatchlistStatus(gh<_i940.WatchlistRepository>()));
    gh.lazySingleton<_i479.SearchLocalDataSource>(
        () => _i479.SearchLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i739.GetTrendingMovies>(
        () => homeModule.getTrendingMovies(gh<_i283.MovieRepository>()));
    gh.lazySingleton<_i739.GetPopularMovies>(
        () => homeModule.getPopularMovies(gh<_i283.MovieRepository>()));
    gh.lazySingleton<_i739.GetTopRatedMovies>(
        () => homeModule.getTopRatedMovies(gh<_i283.MovieRepository>()));
    gh.lazySingleton<_i739.GetNowPlayingMovies>(
        () => homeModule.getNowPlayingMovies(gh<_i283.MovieRepository>()));
    gh.factory<_i843.HomeBloc>(() => _i843.HomeBloc(
          getTrendingMovies: gh<_i739.GetTrendingMovies>(),
          getPopularMovies: gh<_i739.GetPopularMovies>(),
          getTopRatedMovies: gh<_i739.GetTopRatedMovies>(),
          getNowPlayingMovies: gh<_i739.GetNowPlayingMovies>(),
        ));
    gh.lazySingleton<_i1025.SignOut>(
        () => _i1025.SignOut(gh<_i784.AuthRepository>()));
    gh.lazySingleton<_i313.SignInWithGoogle>(
        () => _i313.SignInWithGoogle(gh<_i784.AuthRepository>()));
    gh.lazySingleton<_i438.GetAuthStatusStream>(
        () => _i438.GetAuthStatusStream(gh<_i784.AuthRepository>()));
    gh.factory<_i527.MovieDetailBloc>(() => _i527.MovieDetailBloc(
          getMovieDetail: gh<_i216.GetMovieDetail>(),
          getMovieCast: gh<_i1013.GetMovieCast>(),
          getSimilarMovies: gh<_i880.GetSimilarMovies>(),
        ));
    gh.lazySingleton<_i317.SearchRepository>(() => _i1066.SearchRepositoryImpl(
          remoteDataSource: gh<_i800.SearchRemoteDataSource>(),
          localDataSource: gh<_i479.SearchLocalDataSource>(),
        ));
    gh.factory<_i859.WatchlistBloc>(() => _i859.WatchlistBloc(
          getWatchlist: gh<_i781.GetWatchlist>(),
          addToWatchlist: gh<_i781.AddToWatchlist>(),
          removeFromWatchlist: gh<_i781.RemoveFromWatchlist>(),
          checkWatchlistStatus: gh<_i781.CheckWatchlistStatus>(),
        ));
    gh.factory<_i1040.AuthBloc>(() => _i1040.AuthBloc(
          gh<_i313.SignInWithGoogle>(),
          gh<_i1025.SignOut>(),
          gh<_i438.GetAuthStatusStream>(),
        ));
    gh.lazySingleton<_i1002.GetSearchHistory>(
        () => _i1002.GetSearchHistory(gh<_i317.SearchRepository>()));
    gh.lazySingleton<_i1002.SaveSearchQuery>(
        () => _i1002.SaveSearchQuery(gh<_i317.SearchRepository>()));
    gh.lazySingleton<_i1002.DeleteSearchQuery>(
        () => _i1002.DeleteSearchQuery(gh<_i317.SearchRepository>()));
    gh.lazySingleton<_i8.SearchMovies>(
        () => _i8.SearchMovies(gh<_i317.SearchRepository>()));
    gh.factory<_i157.SearchBloc>(() => _i157.SearchBloc(
          searchMovies: gh<_i8.SearchMovies>(),
          getSearchHistory: gh<_i1002.GetSearchHistory>(),
          saveSearchQuery: gh<_i1002.SaveSearchQuery>(),
          deleteSearchQuery: gh<_i1002.DeleteSearchQuery>(),
        ));
    return this;
  }
}

class _$LocalStorageModule extends _i389.LocalStorageModule {}

class _$NetworkModule extends _i54.NetworkModule {}

class _$HomeModule extends _i922.HomeModule {}
