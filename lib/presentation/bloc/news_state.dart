part of 'news_bloc.dart';

/// Possible states are represented via enum
enum LoadingState {
  init,
  loading,
  loaded,
  failure,
}

@freezed
class NewsState with _$NewsState {
  const NewsState._();

  const factory NewsState({
    @Default([]) List<Article> latestArticles,
    @Default([]) List<Article> featuredArticles,
    Article? detailedArticle,
    @Default(LoadingState.init) LoadingState latestArticlesLoadingState,
    @Default(LoadingState.init) LoadingState featuredArticlesLoadingState,
    @Default(LoadingState.init) LoadingState detailedArticleLoadingState,
  }) = _NewsState;

  bool get hasUnreaded =>
      latestArticles.any((article) => !article.isReaded) ||
      featuredArticles.any((article) => !article.isReaded);

  bool get allIsLoaded =>
      featuredArticlesLoadingState == LoadingState.loaded &&
      latestArticlesLoadingState == LoadingState.loaded &&
      (detailedArticleLoadingState == LoadingState.init ||
          detailedArticleLoadingState == LoadingState.loaded);

  bool get hasFailures =>
      featuredArticlesLoadingState == LoadingState.failure ||
      latestArticlesLoadingState == LoadingState.failure;
}
