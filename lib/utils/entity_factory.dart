import 'package:flutter_mars/models/banner.dart';
import 'package:flutter_mars/models/home_list.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    }
//可以在这里加入任何需要并且可以转换的类型，例如下面
    else if (T.toString() == "BannerModel") {
      return BannerModel.fromJson(json) as T;
    }
    else if (T.toString() == "HomeArticle") {
      return HomeArticle.fromJson(json) as T;
    }
    else {
      return json as T;
    }
  }
}