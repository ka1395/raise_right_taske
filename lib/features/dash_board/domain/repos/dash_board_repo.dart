import 'package:dartz/dartz.dart';

import '../../../../core/error/failuer.dart';
import '../entitys/coins_entity.dart';

abstract class DashBoardRepo {
  Future<Either<Failuer, List<CoinsEntity>>> fetchInitialCoins();
}
