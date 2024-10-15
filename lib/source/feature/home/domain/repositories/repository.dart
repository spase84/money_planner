import 'package:money_planner/source/feature/home/data/models/currency.dart';

abstract interface class HomeRepository {
  Future<List<Currency>> getCurrencies();
}
