import 'package:flutter/material.dart';
import '../../../../core/resources/get_it.dart';
import '../../../../core/resources/routs.dart';
import '../veiw_model/dashboard_cubit/dashboard_cubit.dart';

import 'widget/custom_title.dart';
import 'widget/dash_board_body.dart';

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
  void dispose() {
    instanceGetIt<DashboardCubit>().closeWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: CustomTitle(),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, AppRouts.settingsScreen);
            },
          ),
        ],
      ),
      body: DashBoardBodyWidget(),
    );
  }
}
