import 'package:flutter/material.dart';
import 'package:news_app/config/app_theme.dart';
import 'package:news_app/data/model/article.dart';

import 'article_preview.dart';

class LatestNewsWidget extends StatelessWidget {
  final List<Article> latestArticles;

  const LatestNewsWidget({
    super.key,
    required this.latestArticles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: latestArticles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
          child: ArticlePreview(
            article: latestArticles[index],
            cardHeight: AppSizes.cardSide,
            cardWidth: MediaQuery.of(context).size.width,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
