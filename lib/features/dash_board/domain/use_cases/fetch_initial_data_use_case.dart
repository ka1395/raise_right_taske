import 'package:dartz/dartz.dart';
import 'package:raise_right_taske/features/dash_board/domain/entitys/coins_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repos/dash_board_repo.dart';

class FetchInitialDataUseCase extends UseCase<Map<String, CoinsEntity>, NoParam> {
  final DashBoardRepo dashBoardRepo;

  FetchInitialDataUseCase(this.dashBoardRepo);
  
  @override
  Future<Either<Failure, Map<String,  CoinsEntity>>> call([NoParam? param]) async {
    return await dashBoardRepo.fetchInitialCoins();
  }

}

