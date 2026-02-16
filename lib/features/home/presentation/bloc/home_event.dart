import 'package:equatable/equatable.dart';
import 'package:cineverse/features/home/domain/entities/movie.dart';
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}
class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}
class RefreshHomeData extends HomeEvent {
  const RefreshHomeData();
}