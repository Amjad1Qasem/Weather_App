part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}

final class SearchFetched extends SearchState {
  final WeatherCurrentModel currentModel;

  SearchFetched(this.currentModel);
}
