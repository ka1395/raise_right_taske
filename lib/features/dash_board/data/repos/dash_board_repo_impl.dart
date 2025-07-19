import 'dart:async';
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
  Future<Either<Failuer, Map<String, CoinsEntity>>> fetchInitialCoins() async {
    try {
      Map<String, CoinsEntity> coinsList;
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

  @override
  Future<Either<Failuer, void>> openWebSocket({
    void Function(CoinsEntity p1)? onCoinsReceived,
  }) async {
    try {
      await dashBoardRemoteDataSource.subscribeToTickerCoinsUpdates(
        onCoinsReceived: onCoinsReceived,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> closeWebSocket() async {
    await dashBoardRemoteDataSource.closeWebSocket();
  }
}
