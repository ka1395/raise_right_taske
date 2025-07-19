import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/app_rheme_data.dart';
import '../../veiw_model/dashboard_cubit/dashboard_cubit.dart';
import '../../veiw_model/dashboard_cubit/dashboard_state.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        SizedBox(
          height: 48,
          width: 48,
          child: ClipOval(
            child: Image(
              image: const AssetImage("assets/images/iconApp.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "cryptoCurrency", // Use localized "Welcome"
              textAlign: TextAlign.start,
              style: theme.textTheme.headlineSmall,
            ),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DashboardCubit.get(
                        context,
                      ).statusConnection.toString(), // Use localized user name
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontFamily: AppThemData.semiBold,
                        color: AppThemData.assetColorLightGrey600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
