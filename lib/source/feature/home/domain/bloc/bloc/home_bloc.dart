import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_planner/source/di/service_locator.dart';
import 'package:money_planner/source/feature/home/data/models/currency.dart';
import 'package:money_planner/source/feature/home/domain/repositories/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadCurrenciesEvent>(
        (event, emit) => _onLoadCurrenciesEvent(event, emit));
  }

  final HomeRepository _repository = getIt<HomeRepository>();

  Future<void> _onLoadCurrenciesEvent(
      LoadCurrenciesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final currencies = await _repository.getCurrencies();
      emit(HomeLoaded(currencies: currencies));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(HomeError(message: e.toString()));
    }
  }
}
