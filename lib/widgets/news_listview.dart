import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/new_title_view.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;
  NewsListView({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: GestureDetector(
          //passing NewsTile details to routeName page
          onTap: () => Navigator.pushNamed(context, NewTitleView.id,
              arguments: articles[index]),

          child: NewsTile(
            articleModel: articles[index],
          ),
        ),
      );
    }));
  }
}
