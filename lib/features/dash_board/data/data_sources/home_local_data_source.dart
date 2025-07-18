
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constantd.dart';
import '../../domain/entitys/data_entity.dart';

abstract class HomeLocalDataSource {
  List<DataEntity> fetchData();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<DataEntity> fetchData() {
    var box = Hive.box<DataEntity>(kData);
    return box.values.toList();
  }


}
