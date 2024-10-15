part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Currency> currencies;
  HomeLoaded({required this.currencies});
}

final class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
