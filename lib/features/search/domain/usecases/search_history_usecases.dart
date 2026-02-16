import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSearchHistory {
  final SearchRepository repository;

  GetSearchHistory(this.repository);

  Future<Either<Failure, List<String>>> call() {
    return repository.getSearchHistory();
  }
}

@lazySingleton
class SaveSearchQuery {
  final SearchRepository repository;

  SaveSearchQuery(this.repository);

  Future<Either<Failure, void>> call(String query) {
    return repository.saveSearchQuery(query);
  }
}

@lazySingleton
class DeleteSearchQuery {
  final SearchRepository repository;

  DeleteSearchQuery(this.repository);

  Future<Either<Failure, void>> call(String query) {
    return repository.deleteSearchQuery(query);
  }
}
