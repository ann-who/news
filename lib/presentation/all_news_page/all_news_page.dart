import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/config/app_text.dart';
import 'package:news_app/config/app_theme.dart';
import 'package:news_app/presentation/all_news_page/widgets/featured_news_widget.dart';
import 'package:news_app/presentation/all_news_page/widgets/latest_news_widget.dart';
import 'package:news_app/presentation/bloc/news.dart';
import 'package:news_app/presentation/common_widgets/failure_widget.dart';

/// Class that represents screen with two news lists and "Read all" button.
class AllNewsPage extends StatelessWidget {
  const AllNewsPage({super.key});

  static const routeName = '/allNews';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppText.newsHeader),
            actions: [
              BlocBuilder<NewsBloc, NewsState>(
                buildWhen: (previous, current) =>
                    previous.allIsLoaded != current.allIsLoaded ||
                    previous.hasUnreaded != current.hasUnreaded,
                builder: (context, state) {
                  return ReadAllButton(
                    isButtonActive: state.allIsLoaded && state.hasUnreaded,
                  );
                },
              ),
            ],
          ),
          body: RefreshIndicator(
            backgroundColor: AppColors.lightGray,
            color: AppColors.orange,
            onRefresh: () async {
              /// RefreshIndicator updates articles to their initial state isReaded = false
              context.read<NewsBloc>()
                ..add(FeaturedArticlesLoaded())
                ..add(LatestArticlesLoaded());
            },
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.mediumPadding),
                  child: BlocBuilder<NewsBloc, NewsState>(
                    buildWhen: (previous, current) =>
                        previous.hasFailures != current.hasFailures,
                    builder: (context, state) {
                      if (state.hasFailures) {
                        return const FailureWidget(text: AppText.appError);
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.featuredNews,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: AppSizes.mediumPadding),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: const FeaturedNewsWidget(),
                          ),
                          Text(
                            AppText.latestNews,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const LatestNewsWidget(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReadAllButton extends StatelessWidget {
  const ReadAllButton({
    super.key,
    required this.isButtonActive,
  });

  final bool isButtonActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !isButtonActive
          ? null
          : () => context.read<NewsBloc>().add(AllArticlesReaded()),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(right: AppSizes.smallPadding),
                child: Icon(
                  Icons.mark_chat_read_rounded,
                  size: AppSizes.iconSize,
                  color:
                      isButtonActive ? AppColors.orange : AppColors.lightGray,
                ),
              ),
            ),
            TextSpan(
              text: AppText.readAll,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:
                      isButtonActive ? AppColors.white : AppColors.lightGray),
            ),
          ],
        ),
      ),
    );
  }
}
