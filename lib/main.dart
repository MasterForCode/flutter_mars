import 'package:flutter/material.dart';
import 'package:flutter_mars/pages/home/home_page.dart';
import 'package:flutter_mars/pages/index_page.dart';
import 'package:flutter_mars/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
    HomeProvider pageProvider = HomeProvider();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
//这里是关键注册通知吧
        ChangeNotifierProvider(create: (_) => HomeProvider(),),
      ],
      child: Container(
        child: MaterialApp(
          title: 'Test',
          //去掉DEBUG字样
          debugShowCheckedModeBanner: false,
          //设置主题
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage(),
        ),
      ),
    );
  }
}