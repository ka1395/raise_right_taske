
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failuer.dart';
import '../../domain/entitys/data_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failuer, List<DataEntity>>> fetchData() async {
    try {
      List<DataEntity> datasList;
      datasList = homeLocalDataSource.fetchData();
      if (datasList.isNotEmpty) {
        return right(datasList);
      }
      datasList = await homeRemoteDataSource.fetchData();
      return right(datasList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
