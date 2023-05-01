import 'package:flutter/material.dart';
import 'package:news_app/config/app_text.dart';

import 'package:news_app/config/app_theme.dart';
import 'package:news_app/data/model/article.dart';

/// Class that represents an article's picture. It's in "Common widgets" because
/// it's used on both screens so we don't duplicate widget
class ArticlePicture extends StatelessWidget {
  final Article article;
  final double cardHeight;
  final double cardWidth;

  const ArticlePicture({
    super.key,
    required this.article,
    required this.cardHeight,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: article.realImageUrl,
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              ),
            );

          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Icon(
                Icons.error,
                color: AppColors.error,
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.cardCorner),
                child: Image.network(
                  snapshot.data.toString(),
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: AppColors.error,
                  ),
                  width: cardWidth,
                  height: cardHeight,
                  fit: BoxFit.cover,
                ),
              );
            }
          default:
            return const Center(
              child: Text(AppText.noImage),
            );
        }
      },
    );
  }
}
