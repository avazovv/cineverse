import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props => [];
}

class SearchQueryChanged extends SearchEvent {
  final String query;
  const SearchQueryChanged(this.query);
  @override
  List<Object> get props => [query];
}

class LoadSearchHistory extends SearchEvent {}

class SaveSearchQueryEvent extends SearchEvent {
  final String query;
  const SaveSearchQueryEvent(this.query);
  @override
  List<Object> get props => [query];
}

class DeleteSearchQueryEvent extends SearchEvent {
  final String query;
  const DeleteSearchQueryEvent(this.query);
  @override
  List<Object> get props => [query];
}
