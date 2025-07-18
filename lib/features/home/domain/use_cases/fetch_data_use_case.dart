

import 'package:dartz/dartz.dart';

import '../../../../core/error/failuer.dart';
import '../../../../core/use_case/use_case.dart';
import '../entitys/data_entity.dart';
import '../repos/home_repo.dart';

class FetchDataUseCase extends UseCase<List<DataEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchDataUseCase(this.homeRepo);

  @override
  Future<Either<Failuer, List<DataEntity>>> call([NoParam? param]) {
    return homeRepo.fetchData();
  }
}
