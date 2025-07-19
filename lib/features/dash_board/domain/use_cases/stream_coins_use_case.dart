import 'package:dartz/dartz.dart';
import '../../../../core/error/failuer.dart';
import '../../../../core/use_case/use_case.dart';
import '../entitys/coins_entity.dart';
import '../repos/dash_board_repo.dart';

class StreamCoinsUseCase extends UseCase<void, void Function(CoinsEntity)> {
  final DashBoardRepo dashBoardRepo;

  StreamCoinsUseCase(this.dashBoardRepo);

  @override
  Future<Either<Failuer, void>> call([void Function(CoinsEntity)? param]) {
    return dashBoardRepo.openWebSocket(onCoinsReceived: param);
  }

  Future<void> closeWebSocket() async {
    await dashBoardRepo.closeWebSocket();
  }
}
