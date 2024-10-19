import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_planner/source/feature/home/domain/bloc/bloc/home_bloc.dart';
import 'package:money_planner/source/feature/home/ui/widgets/currency_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocProvider(
          create: (context) => HomeBloc()..add(LoadCurrenciesEvent()),
          child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) => switch (state) {
                    HomeInitial() => const SizedBox.shrink(),
                    HomeLoading() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    HomeError() => Center(
                        child: Text(state.message),
                      ),
                    HomeLoaded() => CurrencyList(
                        pagingController: state.pagingController,
                        onFetchPage: state.onFetchPage,
                      ),
                  })),
    );
  }
}
