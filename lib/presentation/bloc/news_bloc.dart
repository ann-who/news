import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/domain/repository/news_repository.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

/// Bloc for working with news
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final AbstractNewsRepository newsRepository;

  NewsBloc({
    required this.newsRepository,
  }) : super(const NewsState()) {
    on<LatestArticlesLoaded>(_onLatestArticlesLoaded);
    on<FeaturedArticlesLoaded>(_onFeaturedArticlesLoaded);
    on<SingleArticleLoaded>(_onSingleArticleLoaded);
    on<ArticleReaded>(_onArticleReaded);
    on<AllArticlesReaded>(_onAllArticlesReaded);
  }

  /// Event handler when getting latest news.
  /// We emit multiply states in response to the incoming event.
  void _onLatestArticlesLoaded(
    LatestArticlesLoaded event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        latestArticlesLoadingState: LoadingState.loading,
      ),
    );

    List<Article> latestArticles;
    try {
      latestArticles = await newsRepository.getLatestArticles();
    } catch (e) {
      emit(
        state.copyWith(
          latestArticles: [],
          latestArticlesLoadingState: LoadingState.failure,
        ),
      );
      return;
    }

    /// If request was allowed, we emit new state with recieved articles
    emit(
      state.copyWith(
        latestArticlesLoadingState: LoadingState.loaded,
        latestArticles: latestArticles,
      ),
    );
  }

  /// Event handler when getting featured news.
  /// We emit multiply states in response to the incoming event.
  void _onFeaturedArticlesLoaded(
    FeaturedArticlesLoaded event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        featuredArticlesLoadingState: LoadingState.loading,
      ),
    );

    List<Article> featuredArticles;
    try {
      featuredArticles = await newsRepository.getFeaturedArticles();
    } catch (e) {
      emit(
        state.copyWith(
          featuredArticles: [],
          featuredArticlesLoadingState: LoadingState.failure,
        ),
      );
      return;
    }

    /// If request was allowed, we emit new state with recieved articles
    emit(
      state.copyWith(
        featuredArticlesLoadingState: LoadingState.loaded,
        featuredArticles: featuredArticles,
      ),
    );
  }

  /// Event handler when getting one article.
  /// We emit multiply states in response to the incoming event.
  void _onSingleArticleLoaded(
    SingleArticleLoaded event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        detailedArticleLoadingState: LoadingState.loading,
      ),
    );

    Article loadedArticle;
    try {
      loadedArticle = await newsRepository.getArticle(id: event.articleId);
    } catch (e) {
      emit(
        state.copyWith(
          detailedArticle: null,
          detailedArticleLoadingState: LoadingState.failure,
        ),
      );
      return;
    }

    /// If request was allowed, we emit new state with recieved article
    emit(
      state.copyWith(
        detailedArticle: loadedArticle,
        detailedArticleLoadingState: LoadingState.loaded,
      ),
    );
  }

  /// Event handler when a specific article was readed. Event called
  /// only if this article was successfuly loaded.
  void _onArticleReaded(
    ArticleReaded event,
    Emitter<NewsState> emit,
  ) async {
    updateArticle(Article article) => event.articleId != article.id
        ? article
        : article.copyWith(isReaded: true);

    var readedLatestArticles = List<Article>.from(
      state.latestArticles.map(updateArticle).toList(),
    );
    var readedFeaturedArticles = List<Article>.from(
      state.featuredArticles.map(updateArticle).toList(),
    );

    /// We emit new state with featured and latest lists in case if readed article
    /// was in both lists
    emit(
      state.copyWith(
        latestArticles: readedLatestArticles,
        featuredArticles: readedFeaturedArticles,
      ),
    );
  }

  /// Event handler when user wants to mark all articles as readed. Event called
  /// only if all articles were successfuly loaded and there is at least one
  /// unreaded article.
  void _onAllArticlesReaded(
    AllArticlesReaded event,
    Emitter<NewsState> emit,
  ) async {
    var readedLatestArticles = List<Article>.from(
      state.latestArticles
          .map((article) => article.copyWith(isReaded: true))
          .toList(),
    );
    var readedFeaturedArticles = List<Article>.from(
      state.featuredArticles
          .map((article) => article.copyWith(isReaded: true))
          .toList(),
    );

    /// We emit new state with both updated lists
    emit(
      state.copyWith(
        latestArticles: readedLatestArticles,
        featuredArticles: readedFeaturedArticles,
      ),
    );
  }
}
