import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:money_planner/source/feature/home/data/models/currency.dart';
import 'package:money_planner/source/ui/widgets/currency_tile.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({
    super.key,
    required this.pagingController,
    required this.onFetchPage,
  });

  final PagingController<int, Currency> pagingController;
  final Future<void> Function(int page) onFetchPage;

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  void initState() {
    widget.pagingController.addPageRequestListener((pageKey) {
      widget.onFetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 16),
      pagingController: widget.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Currency>(
        itemBuilder: (context, currency, index) => CurrencyTile(
          currency: currency,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
    );

    // return ListView.separated(
    //   padding: const EdgeInsets.symmetric(vertical: 16),
    //   itemCount: (pagingController.itemList ?? []).length,
    //   itemBuilder: (context, index) {
    //     final currency = pagingController.itemList![index];
    //     return CurrencyTile(
    //       currency: currency,
    //     );
    //   },
    //   separatorBuilder: (context, index) => const SizedBox(
    //     height: 16,
    //   ),
    // );
  }
}
