import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raise_right_taske/features/dash_board/presentation/veiw_model/dashboard_cubit/dashboard_state.dart';
import '../../../../core/resources/get_it.dart';
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
          BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) => IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                DashboardCubit.get(context).closeWebSocket();
              },
            ),
          ),
        ],
      ),
      body: DashBoardBodyWidget(),
    );
  }
}
