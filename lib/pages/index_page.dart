import 'package:flutter/material.dart';
import 'package:flutter_mars/pages/home/home_page.dart';
import 'package:flutter_mars/pages/home/widgets/mars_app_bar.dart';
import 'package:flutter_mars/provider/home_provider.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.people),
        title: MarsAppBarTitle(),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: HomePage(),
    );
  }
}
