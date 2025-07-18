import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class DataEntity {
  @HiveField(0)
  final String? data;
  // @HiveField(1)
  // final String image;
  // @HiveField(2)
  // final String title;
  // @HiveField(3)
  // final String authorName;
  // @HiveField(4)
  // final num price;
  // @HiveField(5)
  // final num rating;

  DataEntity({required this.data});
}
