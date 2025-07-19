import 'package:flutter/material.dart';

import '../../../../../core/resources/app_rheme_data.dart';
import '../../veiw_model/dashboard_cubit/dashboard_cubit.dart';

class ErrorGetCryptoCurrencyWidget extends StatelessWidget {
  const ErrorGetCryptoCurrencyWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Failed to load cryptocurrency data',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
           message,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              DashboardCubit.get(context).fetchInitialCoins();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppThemData.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
