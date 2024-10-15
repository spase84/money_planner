import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:money_planner/source/feature/home/data/datasources/datasource.dart';
import 'package:money_planner/source/feature/home/data/models/currency.dart';
import 'package:money_planner/source/network/client.dart';

@Injectable(as: Home$DataSource)
final class HomeRemoteDataSource implements Home$DataSource {
  late final RestClient _client;

  HomeRemoteDataSource() {
    _initClient();
  }

  void _initClient() {
    final dio = Dio();
    dio.options.queryParameters['api_key'] = dotenv.env['API_KEY'];
    _client = RestClient(dio);
  }

  @override
  Future<List<Currency>> getCurrencies() async {
    final response = await _client.getCurrencies();
    if (response.status?.success == true) {
      return response.data ?? [];
    }
    // Todo: handle error
    return [];
  }
}
