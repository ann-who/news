import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:news_app/config/app_text.dart';
import 'package:news_app/config/app_theme.dart';
import 'package:news_app/presentation/bloc/news.dart';
import 'package:news_app/presentation/common_widgets/article_picture.dart';
import 'package:shimmer/shimmer.dart';

/// Class that represents screen with detailed article info:
/// title, publication date, image and text. Also contains loading states (
/// loaded, loading and failure widgets)
class ArticleDetailsPage extends StatefulWidget {
  final String articleId;

  const ArticleDetailsPage({
    super.key,
    required this.articleId,
  });

  static const routeName = '/articleDetails';

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  void initState() {
    /// Load single article

    context
        .read<NewsBloc>()
        .add(SingleArticleLoaded(articleId: widget.articleId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.newsHeader),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.mediumPadding),
            child: BlocConsumer<NewsBloc, NewsState>(
              listenWhen: (previous, current) =>
                  previous.detailedArticleLoadingState !=
                  current.detailedArticleLoadingState,
              listener: (context, state) {
                /// Mark article as readed only if it was loaded

                if (state.detailedArticle != null &&
                    state.detailedArticleLoadingState == LoadingState.loaded) {
                  context
                      .read<NewsBloc>()
                      .add(ArticleReaded(articleId: state.detailedArticle!.id));
                }
              },
              builder: (context, state) {
                if ([LoadingState.init, LoadingState.loading]
                    .contains(state.detailedArticleLoadingState)) {
                  return const LoadingArticleShimmer();
                } else if (state.detailedArticleLoadingState ==
                    LoadingState.failure) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4,
                    ),
                    child: Text(
                      AppText.articleNotFound,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  );
                }

                return Column(
                  children: [
                    /// Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.detailedArticle!.title,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        const SizedBox(width: AppSizes.mediumPadding),
                        Text(
                          DateFormat('dd.MM.yyyy')
                              .format(state.detailedArticle!.publicationDate),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.largePadding),

                    /// Image
                    ArticlePicture(
                      article: state.detailedArticle!,
                      cardHeight: AppSizes.cardSide,
                      cardWidth: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(height: AppSizes.largePadding),

                    /// Description
                    Text(
                      state.detailedArticle!.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingArticleShimmer extends StatelessWidget {
  const LoadingArticleShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.lightGray,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.cardCorner),
                    ),
                    color: AppColors.gray,
                  ),
                  height: AppSizes.largePadding,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.cardCorner),
                    ),
                    color: AppColors.gray,
                  ),
                  height: AppSizes.largePadding,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.largePadding),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.cardCorner),
                ),
                color: AppColors.gray,
              ),
              height: AppSizes.cardSide,
            ),
            const SizedBox(height: AppSizes.largePadding),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.cardCorner),
                ),
                color: AppColors.gray,
              ),
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
