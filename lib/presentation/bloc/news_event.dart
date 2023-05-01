part of 'news_bloc.dart';

/// Class for possible events with news.
/// It's abstract so that in the future it will be possible to add events.

abstract class NewsEvent {}

class LatestArticlesLoaded extends NewsEvent {
  LatestArticlesLoaded();
}

class FeaturedArticlesLoaded extends NewsEvent {
  FeaturedArticlesLoaded();
}

class SingleArticleLoaded extends NewsEvent {
  final String articleId;

  SingleArticleLoaded({
    required this.articleId,
  });
}

class ArticleReaded extends NewsEvent {
  final String articleId;
  ArticleReaded({
    required this.articleId,
  });
}

class AllArticlesReaded extends NewsEvent {
  AllArticlesReaded();
}