import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mars/models/banner.dart';
import 'package:flutter_mars/models/home_list.dart';
import 'package:flutter_mars/provider/home_provider.dart';
import 'package:flutter_mars/utils/api_url.dart';
import 'package:flutter_mars/utils/dio_manager.dart';
import 'package:flutter_mars/utils/http_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageArticlePage = 0;

  Future<List<BannerModel>> getSwiper() async {
    List<BannerModel> result;
    await DioManager().requestList<BannerModel>(
        HttpMethod.GET, ApiUrl.bannerApi, success: (data) {
      result = data;
    }, error: (error) {});
    return result;
  }

  Widget _buildSwiper() {
    return Container(
      height: 228.0,
      child: FutureBuilder(
        future: getSwiper(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BannerModel> data = snapshot.data;
            return Swiper(
              itemCount: data.length,
              pagination: SwiperPagination(),
              autoplay: true,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Image.network(data[index].imagePath),
                  onTap: () {},
                );
              },
            );
          } else {
            return Text('');
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      footer: ClassicalFooter(
        bgColor: Colors.purple,
        textColor: Colors.pink,
        infoColor: Colors.pink,
        noMoreText: '',
        infoText: '加载数据',
        loadReadyText: '上拉加载',
        loadedText: '加载完成',
      ),
      child: ListView(
        children: <Widget>[
          _buildSwiper(),
          Text('---------'),
        ],
      ),
      onLoad: () async {
        return await DioManager().request<HomeArticle>(
            HttpMethod.GET, "article/list/$_currentPageArticlePage/json", success: (data) {
          print(data);
          setState(() {
            _currentPageArticlePage++;
          });
        }, error: (error) {});
      },
    );
  }
}
