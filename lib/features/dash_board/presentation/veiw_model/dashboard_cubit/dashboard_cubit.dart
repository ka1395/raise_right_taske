import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entitys/coins_entity.dart';
import '../../../domain/use_cases/fetch_initial_data_use_case.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  static DashboardCubit get(context) => BlocProvider.of(context);
  final FetchInitialDataUseCase fetchInitialDataUseCase;

  DashboardCubit(this.fetchInitialDataUseCase) : super(DashboardInitial());
  List<CoinsEntity> coinsList = [];
  Future<void> fetchInitialCoins() async {
    emit(GetCoinsLoadingState());
    final result = await fetchInitialDataUseCase.call();
    result.fold(
      (failure) {
        emit(GetCoinsErrorState(failure.meesage));
        print(failure.meesage);
      },

      (coins) {
        coinsList = coins; // Store the fetched coins in the local list
        emit(GetCoinsSuccessState());
      },
    );
  }
}
