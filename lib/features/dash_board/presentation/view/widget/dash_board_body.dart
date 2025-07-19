import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raise_right_taske/core/utils/app_cubit/app_states.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/resources/app_rheme_data.dart';
import '../../../../../core/resources/get_it.dart';
import '../../../../../core/utils/app_cubit/app_cubit.dart';
import '../../veiw_model/dashboard_cubit/dashboard_cubit.dart';
import '../../veiw_model/dashboard_cubit/dashboard_state.dart';
import 'coins_list_view.dart';
import 'custom_crypto_currency_loading_skeleton_list.dart';
import 'error_get_crypto_currency_widget.dart';

class DashBoardBodyWidget extends StatelessWidget {
  const DashBoardBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = instanceGetIt.get<AppCubit>();
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        final coinsList = DashboardCubit.get(context).coinsList.values.toList();

        // Handle error state
        if (state is GetInitCoinsErrorState) {
          return ErrorGetCryptoCurrencyWidget(message: state.message);
        }
        if (state is GetInitCoinsLoadingState) {
          return BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) => Skeletonizer(
              containersColor: themeChange.getThem()
                  ? AppThemData.primaryColor
                  : AppThemData.assetColorGrey100,
              enableSwitchAnimation: true,
              effect: ShimmerEffect(
                baseColor: themeChange.getThem()
                    ? AppThemData.assetColorGrey
                    : AppThemData.assetColorGrey300,
              ),
              enabled: true,
              child: const CustomCryptoCurrencyLoadingSkeletonList(),
            ),
          );
        }

        return CoinsListView(coinsList: coinsList);
      },
    );
  }
}
