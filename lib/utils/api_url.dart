class ApiUrl {
  static final baseApi = "https://www.wanandroid.com/";
  // 首页banner
  static final bannerApi = "banner/json";
  // 首页文章列表
  static final homeArticleApi = "article/list/0/json";
  static final loginPath = "user/login";//接口返回：{"code": int, "message": "String", "data": {"account": "String", "password": "String"}}
  static final queryListPath = "/query/list";//接口返回：{"code": ing, "message": "String", "data": [int, int, String, int, String, int]}
  static final queryListJsonPath = "/query/listjson";//接口返回：{"code": int, "message": "String", "data": [{"account": "String", "password": "String"}， {"account": "String", "password": "String"}]}
}