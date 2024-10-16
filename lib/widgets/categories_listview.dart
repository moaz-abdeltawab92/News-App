import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  final ScrollController _scrollController = ScrollController();
  bool _isMouseOver = false; // حالة لتحديد ما إذا كان الماوس فوق العناصر

  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: 'Business', image: 'assets/bs2.jpg'),
    CategoryModel(categoryName: 'Entertainment', image: 'assets/1.jpeg'),
    CategoryModel(categoryName: 'General', image: 'assets/2.jpeg'),
    CategoryModel(categoryName: 'Health', image: 'assets/h2.webp'),
    CategoryModel(categoryName: 'Science', image: 'assets/sc.jpg'),
    CategoryModel(categoryName: 'Sports', image: 'assets/sp.avif'),
    CategoryModel(categoryName: 'Technology', image: 'assets/th.jpeg'),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    if (!_isMouseOver) {
      // تحقق إذا لم يكن الماوس فوق العناصر
      Future.delayed(Duration(seconds: 2), () {
        _scrollToEndAndBack();
      });
    }
  }

  void _scrollToEndAndBack() {
    if (!_isMouseOver) {
      // تحقق إذا لم يكن الماوس فوق العناصر
      _scrollController
          .animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 20),
        curve: Curves.easeInOut,
      )
          .then((_) {
        _scrollController
            .animateTo(
          _scrollController.position.minScrollExtent,
          duration: Duration(seconds: 20),
          curve: Curves.easeInOut,
        )
            .then((_) {
          _startAutoScroll(); // استئناف الرسوم المتحركة
        });
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                _isMouseOver = true; // عند دخول الماوس
              });
            },
            onExit: (_) {
              setState(() {
                _isMouseOver = false; // عند مغادرة الماوس
                // لا حاجة لاستئناف الرسوم المتحركة
              });
            },
            child: CategoryCard(
              category: categories[index],
            ),
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:news_app/models/category_model.dart';

// import 'category_card.dart';

// class CategoriesListView extends StatelessWidget {
//   const CategoriesListView({
//     super.key,
//   });
//   final List<CategoryModel> categories = const [
//     CategoryModel(categoryName: 'Business', image: 'assets/bs2.jpg'),
//     CategoryModel(categoryName: 'Entertainment', image: 'assets/1.jpeg'),
//     CategoryModel(categoryName: 'General', image: 'assets/2.jpeg'),
//     CategoryModel(categoryName: 'Health', image: 'assets/h2.webp'),
//     CategoryModel(categoryName: 'Science', image: 'assets/sc.jpg'),
//     CategoryModel(categoryName: 'Sports', image: 'assets/sp.avif'),
//     CategoryModel(categoryName: 'Technology', image: 'assets/th.jpeg'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) {
//             return CategoryCard(
//               category: categories[index],
//             );
//           }),
//     );
//   }
// }
