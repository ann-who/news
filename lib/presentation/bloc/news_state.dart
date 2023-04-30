part of 'news_bloc.dart';

enum LoadingState {
  init,
  loading,
  loaded,
  failure,
}

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List<Article> latestArticles,
    @Default([]) List<Article> featuredArticles,
    Article? detailedArticle,
    @Default(LoadingState.init) LoadingState articlesLoadingState,
    @Default(LoadingState.init) LoadingState singleArticleLoadingState,
  }) = _NewsState;
}
