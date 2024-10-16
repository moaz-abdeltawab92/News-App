import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_sevices.dart';
import 'package:news_app/widgets/news_listview.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    future = NewsSevices(Dio()).getTopHeadlines(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Text(
                    "Something went wrong, Please try again later",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}
