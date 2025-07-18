import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failuer.dart';
import '../../domain/entitys/coins_entity.dart';
import '../../domain/repos/dash_board_repo.dart';
import '../data_sources/dash_board_remote_data_source.dart';

class DashBoardRepoImpl extends DashBoardRepo {
  final DashBoardRemoteDataSource dashBoardRemoteDataSource;

  DashBoardRepoImpl({required this.dashBoardRemoteDataSource});

  @override
  Future<Either<Failuer, List<CoinsEntity>>> fetchInitialCoins() async {
    try {
      List<CoinsEntity> coinsList;
      coinsList = await dashBoardRemoteDataSource.fetchInitialCoins();
      return right(coinsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
