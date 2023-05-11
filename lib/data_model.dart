import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class dataModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subtitle;

  dataModel({required this.title, required this.subtitle});
}
