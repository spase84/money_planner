import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_planner/source/feature/home/domain/bloc/bloc/home_bloc.dart';

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
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is HomeLoaded) {
                return ListView.builder(
                  itemCount: state.currencies.length,
                  itemBuilder: (context, index) {
                    final currency = state.currencies[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(currency.name),
                            const Spacer(),
                            Text(currency.symbol.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
