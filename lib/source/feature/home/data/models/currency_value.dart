import 'package:json_annotation/json_annotation.dart';

part 'currency_value.g.dart';

@JsonSerializable(createToJson: false)
class CurrencyValue {
  final double price;

  @JsonKey(name: 'percentChange24h')
  final double? change24h;

  CurrencyValue({
    required this.price,
    required this.change24h,
  });

  factory CurrencyValue.fromJson(Map<String, dynamic> json) =>
      _$CurrencyValueFromJson(json);
}
