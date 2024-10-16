import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewTitleView extends StatefulWidget {
  const NewTitleView({super.key});
  static const String id = '/newTitleView';

  @override
  State<NewTitleView> createState() => _NewTitleViewState();
}

class _NewTitleViewState extends State<NewTitleView> {
  late final ArticleModel articleModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the passed single ArticleModel object from the previous page
    articleModel = ModalRoute.of(context)!.settings.arguments as ArticleModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 236, 236),
      appBar: AppBar(
        title: const Text(
          "News Details",
          style: TextStyle(color: Color.fromARGB(255, 79, 77, 77)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(articleModel.image ?? ''),
            const SizedBox(height: 20),
            Text(
              articleModel.title ?? 'No Title',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              articleModel.subTitle ?? 'No Content',
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                launch(articleModel.urlnews ?? 'No Content');

                // Navigator.of(context).pop();
              },
              child: const Text('Click Here To Read More...',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
