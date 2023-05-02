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

  /// Check if there are unreaded articles
  bool get hasUnreaded =>
      latestArticles.any((article) => !article.isReaded) ||
      featuredArticles.any((article) => !article.isReaded);

  /// Check if all articles are loaded
  bool get allIsLoaded =>
      featuredArticlesLoadingState == LoadingState.loaded &&
      latestArticlesLoadingState == LoadingState.loaded &&
      (detailedArticleLoadingState == LoadingState.init ||
          detailedArticleLoadingState == LoadingState.loaded);

  /// Check if there is loading failure
  bool get hasFailures =>
      featuredArticlesLoadingState == LoadingState.failure ||
      latestArticlesLoadingState == LoadingState.failure;
}
