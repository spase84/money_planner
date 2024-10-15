import 'package:injectable/injectable.dart';
import 'package:money_planner/source/feature/home/data/datasources/datasource.dart';
import 'package:money_planner/source/feature/home/data/models/currency.dart';
import 'package:money_planner/source/feature/home/domain/repositories/repository.dart';

@Injectable(as: HomeRepository)
class Home$RemoteRepository implements HomeRepository {
  late final Home$DataSource remoteDataSource;

  Home$RemoteRepository(this.remoteDataSource);

  @override
  Future<List<Currency>> getCurrencies() => remoteDataSource.getCurrencies();
}
