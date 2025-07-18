import '../../../../core/network/dio.dart';
import '../../domain/entitys/data_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<DataEntity>> fetchData();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  @override
  Future<List<DataEntity>> fetchData() async {
    var response = await DioHelper.get(url: "endpoint");
    List<DataEntity> dataList = [];
    response;//do operations to parse the response
    return dataList;
  }
}
