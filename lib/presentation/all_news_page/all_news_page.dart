import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/presentation/all_news_page/widgets/featured_news_widget.dart';
import 'package:news_app/presentation/all_news_page/widgets/latest_news_widget.dart';
import 'package:news_app/presentation/bloc/news.dart';

import '../../config/app_text.dart';
import '../../config/app_theme.dart';

class AllNewsPage extends StatelessWidget {
  const AllNewsPage({super.key});

  static const routeName = '/allNews';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: RefreshIndicator(
        displacement: MediaQuery.of(context).size.height * 0.2,
        backgroundColor: AppColors.lightGray,
        color: AppColors.orange,
        onRefresh: () async {
          // RefreshIndicator updates articles to their initial state isReaded = false
          BlocProvider.of<NewsBloc>(context)
            ..add(FeaturedArticlesLoaded())
            ..add(LatestArticlesLoaded());
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(AppText.newsHeader),
              actions: [
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    bool unreadedArticlesExist = state.latestArticles
                            .where((article) => article.isReaded == false)
                            .isNotEmpty &&
                        state.featuredArticles
                            .where((article) => article.isReaded == false)
                            .isNotEmpty;

                    bool isButtonActive = unreadedArticlesExist &&
                        state.articlesLoadingState == LoadingState.loaded;

                    return TextButton(
                      onPressed: isButtonActive
                          ? () =>
                              context.read<NewsBloc>().add(AllArticlesReaded())
                          : null,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: AppSizes.smallPadding),
                                child: Icon(
                                  Icons.mark_chat_read_rounded,
                                  size: AppSizes.iconSize,
                                  color: isButtonActive
                                      ? AppColors.orange
                                      : AppColors.lightGray,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: AppText.readAll,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: isButtonActive
                                          ? AppColors.white
                                          : AppColors.lightGray),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<NewsBloc, NewsState>(
              buildWhen: (previous, current) =>
                  previous.latestArticles != current.latestArticles ||
                  previous.featuredArticles != current.featuredArticles ||
                  previous.articlesLoadingState != current.articlesLoadingState,
              builder: (context, state) {
                if ([LoadingState.init, LoadingState.loading]
                    .contains(state.articlesLoadingState)) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.orange,
                    ),
                  );
                } else if (state.articlesLoadingState == LoadingState.failure) {
                  return Center(
                    child: Text(
                      AppText.appError,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.mediumPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.featuredNews,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: AppSizes.mediumPadding),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: FeaturedNewsWidget(
                              featuredArticles: state.featuredArticles,
                            ),
                          ),
                          Text(
                            AppText.latestNews,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          LatestNewsWidget(
                            latestArticles: state.latestArticles,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
