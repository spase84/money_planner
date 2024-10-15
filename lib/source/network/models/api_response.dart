import 'package:json_annotation/json_annotation.dart';
import 'package:money_planner/source/network/models/response_status.dart';

part 'api_response.g.dart';

@JsonSerializable(
  createToJson: false,
  genericArgumentFactories: true,
)
class ApiResponse<T> {
  T? data;
  ResponseStatus? status;

  ApiResponse({
    this.data,
    this.status,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
