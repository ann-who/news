import 'package:flutter/material.dart';
import 'package:news_app/config/app_theme.dart';
import 'package:news_app/data/model/article.dart';

import 'article_preview.dart';

class FeaturedNewsWidget extends StatelessWidget {
  final List<Article> featuredArticles;

  const FeaturedNewsWidget({
    super.key,
    required this.featuredArticles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: featuredArticles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: AppSizes.mediumPadding),
          child: ArticlePreview(
            article: featuredArticles[index],
            cardWidth: AppSizes.cardSide,
            cardHeight: AppSizes.cardSide,
          ),
        );
      },
    );
  }
}
