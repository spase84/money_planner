import 'package:json_annotation/json_annotation.dart';

part 'response_status.g.dart';

@JsonSerializable(createToJson: false)
class ResponseStatus {
  final bool success;
  final int code;
  final String? message;

  ResponseStatus({
    required this.success,
    required this.code,
    this.message,
  });

  factory ResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusFromJson(json);
}
