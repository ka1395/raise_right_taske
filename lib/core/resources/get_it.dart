import 'package:get_it/get_it.dart';

import '../../features/dash_board/data/data_sources/dash_board_remote_data_source.dart';
import '../../features/dash_board/data/repos/dash_board_repo_impl.dart';
import '../../features/dash_board/domain/use_cases/fetch_initial_data_use_case.dart';
import '../../features/dash_board/domain/use_cases/stream_coins_use_case.dart';
import '../../features/dash_board/presentation/veiw_model/dashboard_cubit/dashboard_cubit.dart';

final instanceGetIt = GetIt.instance;

// Future<void> initAppModule() async {
//   // app module, its a module where we put all generic dependencies

//   // shared prefs instance
//   final sharedPrefs = await SharedPreferences.getInstance();

//   instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

//   instance
//       .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
//   // network info
//   instance.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(InternetConnectionChecker()));

//   // dio factory
//   instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

//   Dio dio = await instance<DioFactory>().getDio();
//   //app service client
//   instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

//   // remote data source
//   instance.registerLazySingleton<RemoteDataSource>(
//       () => RemoteDataSourceImpl(instance<AppServiceClient>()));

//   // repository

//   instance.registerLazySingleton<Repository>(
//       () => RepositoryImpl(instance(), instance()));
// }

initCoinsModule() {
  if (!GetIt.I.isRegistered<DashBoardRemoteDataSourceImp>()) {
    instanceGetIt.registerLazySingleton<DashBoardRemoteDataSourceImp>(
      () => DashBoardRemoteDataSourceImp(),
    );
  }
  if (!GetIt.I.isRegistered<DashBoardRepoImpl>()) {
    instanceGetIt.registerLazySingleton<DashBoardRepoImpl>(
      () => DashBoardRepoImpl(
        dashBoardRemoteDataSource:
            instanceGetIt<DashBoardRemoteDataSourceImp>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<FetchInitialDataUseCase>()) {
    instanceGetIt.registerFactory<FetchInitialDataUseCase>(
      () => FetchInitialDataUseCase(instanceGetIt<DashBoardRepoImpl>()),
    );
  }
  if (!GetIt.I.isRegistered<StreamCoinsUseCase>()) {
    instanceGetIt.registerFactory<StreamCoinsUseCase>(
      () => StreamCoinsUseCase(instanceGetIt<DashBoardRepoImpl>()),
    );
  }
  if (!GetIt.I.isRegistered<DashboardCubit>()) {
    instanceGetIt.registerFactory<DashboardCubit>(
      () => DashboardCubit(instanceGetIt<FetchInitialDataUseCase>(),
          instanceGetIt<StreamCoinsUseCase>()),
    );
  }
}
