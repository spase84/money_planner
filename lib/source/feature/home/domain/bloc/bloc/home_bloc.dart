import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:money_planner/source/di/service_locator.dart';
import 'package:money_planner/source/feature/home/data/models/currency.dart';
import 'package:money_planner/source/feature/home/domain/repositories/repository.dart';
import 'package:money_planner/source/settings/constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadCurrenciesEvent>(
        (event, emit) => _onLoadCurrenciesEvent(event, emit));
  }

  final HomeRepository _repository = getIt<HomeRepository>();

  final PagingController<int, Currency> _pagingController = PagingController(
    firstPageKey: 0,
  );

  Future<void> _onLoadCurrenciesEvent(
      LoadCurrenciesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      await _fetchPage(0);
      emit(HomeLoaded(
          pagingController: _pagingController, onFetchPage: _fetchPage));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> _fetchPage(int page) async {
    final newItems = await _repository.getCurrencies(
      offset: page * AppConstants.pageSize,
      limit: AppConstants.pageSize,
    );
    final isLastPage = newItems.length < AppConstants.pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(newItems);
    } else {
      final nextPageKey = page + 1;
      _pagingController.appendPage(newItems, nextPageKey);
    }
  }

  @override
  Future<void> close() {
    _pagingController.dispose();
    return super.close();
  }
}
