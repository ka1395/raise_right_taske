import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raise_right_taske/features/dash_board/presentation/veiw_model/dashboard_cubit/dashboard_state.dart';
import '../../../../core/resources/get_it.dart';
import '../veiw_model/dashboard_cubit/dashboard_cubit.dart';
import 'widget/custom_crypto_currency_item.dart';
import 'widget/custom_title.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    initCoinsModule();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instanceGetIt<DashboardCubit>()..fetchInitialCoins(),
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 100, title: CustomTitle()),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) => ListView.builder(
            itemCount: DashboardCubit.get(context).coinsList.length,
            itemBuilder: (context, index) {
              var coinsItem = DashboardCubit.get(context).coinsList[index];
              return CustomCryptoCurrencyItem(
                symbol: coinsItem.symbol,
                name: coinsItem.name,
                price: coinsItem.price,
                volume: coinsItem.volume,
                status: coinsItem.status,
                volumeSpike: coinsItem.volumeSpike,
                volumeSpikeRatio: coinsItem.volumeSpikeRatio,
              );
            },
          ),
        ),
      ),
    );
  }
}
