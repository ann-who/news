import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/config/app_text.dart';

import 'package:news_app/config/app_theme.dart';
import 'package:news_app/data/model/article.dart';

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
            return const CircularProgressIndicator(
              color: AppColors.orange,
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
                child: CachedNetworkImage(
                  imageUrl: snapshot.data.toString(),
                  errorWidget: (context, url, error) => const Icon(
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
