import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/config/app_theme.dart';
import 'package:news_app/presentation/all_news_page/widgets/article_preview.dart';
import 'package:news_app/presentation/bloc/news.dart';
import 'package:shimmer/shimmer.dart';

/// Class for LatestNews list and its loading state
class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (previous, current) =>
          previous.latestArticlesLoadingState !=
              current.latestArticlesLoadingState ||
          previous.latestArticles != current.latestArticles,
      builder: (context, state) {
        if (state.latestArticlesLoadingState == LoadingState.loading) {
          return const LoadingLatestShimmers();
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.latestArticles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
              child: ArticlePreview(
                article: state.latestArticles[index],
                cardHeight: AppSizes.cardSide,
                cardWidth: MediaQuery.of(context).size.width,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
    );
  }
}

class LoadingLatestShimmers extends StatelessWidget {
  const LoadingLatestShimmers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.lightGray,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.cardCorner),
                    ),
                    color: AppColors.gray,
                  ),
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
          );
        },
        itemCount: AppSizes.shimmersQuantity,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
