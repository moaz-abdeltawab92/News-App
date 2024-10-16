import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_listview.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String id = 'home_view';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 239, 236, 236), //شفافة
          elevation: 0,
          centerTitle: true,
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              ' News',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 27),
            ),
            Text(
              ' Cloud ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 27),
            ),
          ]),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 7, // بتاعت ال appbar
            horizontal: 12,
          ),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade500,
                  indent: 25,
                  endIndent: 25,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              NewsListViewBuilder(
                category: 'general',
              ),
            ],
          ),
        ));
  }
}
