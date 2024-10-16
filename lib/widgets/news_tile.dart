import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: articleModel.image != null
              ? Image.network(
                  articleModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )
              : CachedNetworkImage(
                  imageUrl:
                      "https://via.placeholder.com/400x200.png?text=No+Image+Available",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          //check if article model .title == "[Removed]" and null show "No Title"
          articleModel.title == "[Removed]" || articleModel.title == null
              ? "No Title"
              : articleModel.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          articleModel.subTitle == "[Removed]" || articleModel.subTitle == null
              ? "No subTitle"
              : articleModel.subTitle!,
          maxLines: 2,

          //overflow: TextOverflow.ellipsis,
          style:
              TextStyle(color: Color.fromARGB(255, 59, 57, 57), fontSize: 14),
        ),
      ],
    );
  }
}
