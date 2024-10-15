// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      values: (json['values'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, CurrencyValue.fromJson(e as Map<String, dynamic>)),
      ),
      updatedAt: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );
