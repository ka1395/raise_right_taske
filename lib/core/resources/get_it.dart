import 'package:get_it/get_it.dart';

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

// initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance<LoginUseCase>()));
//   }
 
// }