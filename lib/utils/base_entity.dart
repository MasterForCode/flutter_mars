import 'entity_factory.dart';

class BaseEntity<T> {
  int errorCode;
  String errorMessage;
  T data;

  BaseEntity({this.errorCode, this.errorMessage, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      errorCode: json["errorCode"],
      errorMessage: json["errorMessage"],
      // data值需要经过工厂转换为我们传进来的类型
      data: EntityFactory.generateOBJ<T>(json["data"]),
    );
  }
}