import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  // 页面对应的下标
  int currentPageIndex = 0;

  int currentArticlesIndex = 0;

  // 改变页面下标
  changeCurrentPageIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  // 改变首页文章页码
  changeCurrentArticlesIndex(int index) {
    currentArticlesIndex = index;
    notifyListeners();
  }
}