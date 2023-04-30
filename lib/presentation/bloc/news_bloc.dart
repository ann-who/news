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
    on<AllArticlesReaded>(_onAllArticlesReaded);
  }

  void _onLatestArticlesLoaded(
    LatestArticlesLoaded event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        articlesLoadingState: LoadingState.loading,
      ),
    );

    List<Article> latestArticles;
    try {
      latestArticles = await newsRepository.getLatestArticles();
    } catch (e) {
      emit(
        state.copyWith(
          latestArticles: [],
          articlesLoadingState: LoadingState.failure,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        articlesLoadingState: LoadingState.loaded,
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
        articlesLoadingState: LoadingState.loading,
      ),
    );

    List<Article> featuredArticles;
    try {
      featuredArticles = await newsRepository.getFeaturedArticles();
    } catch (e) {
      emit(
        state.copyWith(
          featuredArticles: [],
          articlesLoadingState: LoadingState.failure,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        articlesLoadingState: LoadingState.loaded,
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
        singleArticleLoadingState: LoadingState.loading,
      ),
    );

    Article loadedArticle;
    try {
      loadedArticle = await newsRepository.getArticle(id: event.articleId);
    } catch (e) {
      emit(
        state.copyWith(
          detailedArticle: null,
          singleArticleLoadingState: LoadingState.failure,
        ),
      );
      return;
    }

    // Mark opened article as 'readed'
    var allArticles = List<Article>.from(state.latestArticles);

    List<Article> readedArticles = allArticles.map(
      (article) {
        if (article.id == loadedArticle.id) {
          return article.copyWith(isReaded: true);
        }
        return article;
      },
    ).toList();

    var featuredArticles =
        readedArticles.where((article) => article.isFeatured == true).toList();

    emit(
      state.copyWith(
        latestArticles: readedArticles,
        featuredArticles: featuredArticles,
        detailedArticle: loadedArticle,
        singleArticleLoadingState: LoadingState.loaded,
      ),
    );
  }

  void _onAllArticlesReaded(
    AllArticlesReaded event,
    Emitter<NewsState> emit,
  ) async {
    var latestArticles = List<Article>.from(state.latestArticles);
    var readedLatestArticles = latestArticles
        .map((article) => article.copyWith(isReaded: true))
        .toList();
    var featuredArticles = List<Article>.from(state.featuredArticles);
    var readedFeaturedArticles = featuredArticles
        .map((article) => article.copyWith(isReaded: true))
        .toList();

    emit(
      state.copyWith(
        latestArticles: readedLatestArticles,
        featuredArticles: readedFeaturedArticles,
      ),
    );
  }
}
