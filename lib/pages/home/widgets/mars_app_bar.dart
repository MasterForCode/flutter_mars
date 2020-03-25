import 'package:flutter/material.dart';
import 'package:flutter_mars/provider/home_provider.dart';
import 'package:provider/provider.dart';

class MarsAppBarTitle extends StatefulWidget {
  @override
  _MarsAppBarTitleState createState() => _MarsAppBarTitleState();
}

class _MarsAppBarTitleState extends State<MarsAppBarTitle> {
  List<String> tabs = ['首页', '项目', '动态', '体系'];
  int _currentIndex = 0;

  Widget _build(String str) {
    int _index = tabs.indexOf(str);
    return Container(
      alignment: Alignment.center,
      decoration: _index == _currentIndex
          ? BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.white)))
          : null,
      height: 50.0,
      child: InkWell(
        child: Text(str),
        onTap: () {
          setState(() {
            _currentIndex = _index;
          });
          Provider.of<HomeProvider>(context, listen: false).changeCurrentPageIndex(_index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: tabs.map((e) => _build(e)).toList(),
    );
  }
}
