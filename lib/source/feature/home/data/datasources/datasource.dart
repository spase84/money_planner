import 'package:money_planner/source/feature/home/data/models/currency.dart';

abstract class Home$DataSource {
  Future<List<Currency>> getCurrencies(
      {required int offset, required int limit});
}
