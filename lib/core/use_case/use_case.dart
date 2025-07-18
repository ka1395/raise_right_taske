import 'package:dartz/dartz.dart';

import '../error/failuer.dart';

abstract class UseCase<type, Param> {
  Future<Either<Failuer, type>> call([Param param]);
}

class NoParam {}
