import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entitys/coins_entity.dart';

abstract class DashBoardRepo {
  Future<Either<Failure, Map<String, CoinsEntity>>> fetchInitialCoins();
  Future<Either<Failure, void>> openWebSocket({
    void Function(CoinsEntity)? onCoinsReceived,
  });
  Future<void> closeWebSocket();
}
