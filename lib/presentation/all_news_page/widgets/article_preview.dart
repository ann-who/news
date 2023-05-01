import 'package:flutter/material.dart';

import 'package:news_app/config/app_theme.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/presentation/common_widgets/article_picture.dart';

/// Article preview for AllNewsPage.
/// There are picture, title and readed/unreaded mark
class ArticlePreview extends StatelessWidget {
  final Article article;
  final double cardHeight;
  final double cardWidth;

  const ArticlePreview({
    super.key,
    required this.article,
    required this.cardHeight,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.cardCorner),
      splashColor: AppColors.lightGreen,
      onTap: () {
        Navigator.pushNamed(
          context,
          '/articleDetails',
          arguments: article.id,
        );
      },
      child: SizedBox(
        width: cardWidth,
        child: Column(
          children: [
            Card(
              child: Stack(
                children: [
                  ArticlePicture(
                    article: article,
                    cardHeight: cardHeight,
                    cardWidth: cardWidth,
                  ),
                  if (article.isReaded == false) const UnreadBubble(),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.mediumPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.smallPadding,
              ),
              child: Text(
                article.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnreadBubble extends StatelessWidget {
  const UnreadBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 10,
      height: AppSizes.unreadedBubble,
      width: AppSizes.unreadedBubble,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizes.cardCorner),
          ),
          color: AppColors.orange,
        ),
      ),
    );
  }
}
