// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyValue _$CurrencyValueFromJson(Map<String, dynamic> json) =>
    CurrencyValue(
      price: (json['price'] as num).toDouble(),
      change24h: (json['percentChange24h'] as num?)?.toDouble(),
    );
