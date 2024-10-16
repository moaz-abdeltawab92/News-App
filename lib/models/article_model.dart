class ArticleModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? urlnews;
  ArticleModel(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.urlnews});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      urlnews: json['url'],
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
    );
  }
  //باختصار ال factory بيسمحلنا  اننا نعمل return ل object
  // ArticleModel.fromJson(json)
}
