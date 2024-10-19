part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final PagingController<int, Currency> pagingController;
  final Future<void> Function(int page) onFetchPage;
  HomeLoaded({
    required this.pagingController,
    required this.onFetchPage,
  });
}

final class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
