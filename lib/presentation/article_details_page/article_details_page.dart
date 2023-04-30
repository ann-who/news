import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:news_app/config/app_text.dart';
import 'package:news_app/config/app_theme.dart';
import 'package:news_app/presentation/bloc/news.dart';
import 'package:news_app/presentation/common_widgets/article_picture.dart';

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
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.orange,
                    ),
                  );
                } else if (state.detailedArticleLoadingState ==
                    LoadingState.failure) {
                  return Center(
                    child: Text(
                      AppText.articleNotFound,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  );
                }

                return Column(
                  children: [
                    // Header
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
                    // Image
                    ArticlePicture(
                      article: state.detailedArticle!,
                      cardHeight: AppSizes.cardSide,
                      cardWidth: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(height: AppSizes.largePadding),
                    // Description
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
