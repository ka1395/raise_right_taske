
import 'package:dartz/dartz.dart';

import '../../../../core/error/failuer.dart';
import '../entitys/data_entity.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<DataEntity>>> fetchData();
}
