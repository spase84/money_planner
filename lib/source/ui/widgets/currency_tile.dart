import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:money_planner/source/extensions/number_extension.dart';
import 'package:money_planner/source/feature/home/data/models/currency.dart';

class CurrencyTile extends StatelessWidget {
  const CurrencyTile({super.key, required this.currency});

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ListTile(
        leading: CurrencyImage(
          symbol: currency.symbol,
          imageUrl: currency.images?['60x60'],
        ),
        title: Text(currency.name),
        subtitle: Text(currency.usdPrice.asCurrency),
        tileColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}

class CurrencyImage extends StatelessWidget {
  const CurrencyImage({
    super.key,
    required this.symbol,
    this.imageUrl,
  });

  final String symbol;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: imageUrl == null
          ? Center(
              child: Text(
                symbol,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              errorWidget: (_, __, ___) => Center(
                child: Text(
                  symbol,
                ),
              ),
            ),
    );
  }
}
