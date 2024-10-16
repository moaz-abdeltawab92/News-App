import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';
import 'package:dio/dio.dart';
import 'package:news_app/views/new_title_view.dart';

void main() {
  runApp(const NewsAPP());
}

final dio = Dio();

class NewsAPP extends StatelessWidget {
  const NewsAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.id: (context) => HomeView(),
        NewTitleView.id: (context) => NewTitleView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
