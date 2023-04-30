import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/domain/repository/news_repository.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

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

    emit(
      state.copyWith(
        latestArticlesLoadingState: LoadingState.loaded,
        latestArticles: latestArticles,
      ),
    );
  }

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

    emit(
      state.copyWith(
        featuredArticlesLoadingState: LoadingState.loaded,
        featuredArticles: featuredArticles,
      ),
    );
  }

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

    emit(
      state.copyWith(
        detailedArticle: loadedArticle,
        detailedArticleLoadingState: LoadingState.loaded,
      ),
    );
  }

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

    emit(
      state.copyWith(
        latestArticles: readedLatestArticles,
        featuredArticles: readedFeaturedArticles,
      ),
    );
  }

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

    emit(
      state.copyWith(
        latestArticles: readedLatestArticles,
        featuredArticles: readedFeaturedArticles,
      ),
    );
  }
}
