import 'entity_factory.dart';

class BaseListEntity<T> {
  int errorCode;
  String errorMessage;
  List<T> data;

  BaseListEntity({this.errorCode, this.errorMessage, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData = new List<T>();
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(EntityFactory.generateOBJ<T>(v));
      });
    }

    return BaseListEntity(
      errorCode: json["errorCode"],
      errorMessage: json["errorMessage"],
      data: mData,
    );
  }
}