part of 'news_bloc.dart';

/// Class for possible events with news.
/// It's abstract so that in the future it will be possible to add events.
abstract class NewsEvent {}

/// Event for loading latest articles
class LatestArticlesLoaded extends NewsEvent {
  LatestArticlesLoaded();
}

/// Event for loading featured articles
class FeaturedArticlesLoaded extends NewsEvent {
  FeaturedArticlesLoaded();
}

/// Event for loading one article
class SingleArticleLoaded extends NewsEvent {
  final String articleId;

  SingleArticleLoaded({
    required this.articleId,
  });
}

/// Event for marking opened (and loaded) article as readed
class ArticleReaded extends NewsEvent {
  final String articleId;
  ArticleReaded({
    required this.articleId,
  });
}

/// Event for marking all articles as readed
class AllArticlesReaded extends NewsEvent {
  AllArticlesReaded();
}
