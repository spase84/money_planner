import 'package:json_annotation/json_annotation.dart';
import 'package:money_planner/source/feature/home/data/models/currency_value.dart';

part 'currency.g.dart';

@JsonSerializable(createToJson: false)
class Currency {
  final int id;
  final String slug;
  final String symbol;
  final String name;
  final Map<String, CurrencyValue> values;
  @JsonKey(name: 'lastUpdated')
  final DateTime? updatedAt;
  final Map<String, String>? images;

  Currency({
    required this.id,
    required this.slug,
    required this.symbol,
    required this.name,
    required this.values,
    this.updatedAt,
    this.images,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  double get usdPrice => values['USD']?.price.toDouble() ?? 0;
}
