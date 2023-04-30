import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:news_app/config/app_theme.dart';
import 'package:news_app/presentation/all_news_page/widgets/article_preview.dart';
import 'package:news_app/presentation/bloc/news.dart';

class FeaturedNewsWidget extends StatelessWidget {
  const FeaturedNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (previous, current) =>
          previous.featuredArticles != current.featuredArticles ||
          previous.featuredArticlesLoadingState !=
              current.featuredArticlesLoadingState,
      builder: (context, state) {
        if (state.featuredArticlesLoadingState == LoadingState.loading) {
          return const LoadingFeaturedShimmers();
        }
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: state.featuredArticles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: AppSizes.mediumPadding),
              child: ArticlePreview(
                article: state.featuredArticles[index],
                cardWidth: AppSizes.cardSide,
                cardHeight: AppSizes.cardSide,
              ),
            );
          },
        );
      },
    );
  }
}

class LoadingFeaturedShimmers extends StatelessWidget {
  const LoadingFeaturedShimmers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.lightGray,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return Padding(
            padding: const EdgeInsets.only(right: AppSizes.mediumPadding),
            child: SizedBox(
              width: AppSizes.cardSide,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppSizes.cardCorner),
                      ),
                      color: AppColors.gray,
                    ),
                    width: AppSizes.cardSide,
                    height: AppSizes.cardSide,
                  ),
                  const SizedBox(height: AppSizes.mediumPadding),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppSizes.cardCorner),
                      ),
                      color: AppColors.gray,
                    ),
                    height: AppSizes.largePadding,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: AppSizes.shimmersQuantity,
      ),
    );
  }
}
