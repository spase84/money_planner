import 'package:money_planner/source/feature/home/data/models/currency.dart';
import 'package:money_planner/source/network/models/api_response.dart';
import 'package:money_planner/source/settings/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/currencies')
  Future<ApiResponse<List<Currency>>> getCurrencies();
}
