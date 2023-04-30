// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsState {
  List<Article> get latestArticles => throw _privateConstructorUsedError;
  List<Article> get featuredArticles => throw _privateConstructorUsedError;
  Article? get detailedArticle => throw _privateConstructorUsedError;
  LoadingState get articlesLoadingState => throw _privateConstructorUsedError;
  LoadingState get singleArticleLoadingState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {List<Article> latestArticles,
      List<Article> featuredArticles,
      Article? detailedArticle,
      LoadingState articlesLoadingState,
      LoadingState singleArticleLoadingState});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestArticles = null,
    Object? featuredArticles = null,
    Object? detailedArticle = freezed,
    Object? articlesLoadingState = null,
    Object? singleArticleLoadingState = null,
  }) {
    return _then(_value.copyWith(
      latestArticles: null == latestArticles
          ? _value.latestArticles
          : latestArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      featuredArticles: null == featuredArticles
          ? _value.featuredArticles
          : featuredArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      detailedArticle: freezed == detailedArticle
          ? _value.detailedArticle
          : detailedArticle // ignore: cast_nullable_to_non_nullable
              as Article?,
      articlesLoadingState: null == articlesLoadingState
          ? _value.articlesLoadingState
          : articlesLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      singleArticleLoadingState: null == singleArticleLoadingState
          ? _value.singleArticleLoadingState
          : singleArticleLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Article> latestArticles,
      List<Article> featuredArticles,
      Article? detailedArticle,
      LoadingState articlesLoadingState,
      LoadingState singleArticleLoadingState});
}

/// @nodoc
class __$$_NewsStateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_NewsState>
    implements _$$_NewsStateCopyWith<$Res> {
  __$$_NewsStateCopyWithImpl(
      _$_NewsState _value, $Res Function(_$_NewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestArticles = null,
    Object? featuredArticles = null,
    Object? detailedArticle = freezed,
    Object? articlesLoadingState = null,
    Object? singleArticleLoadingState = null,
  }) {
    return _then(_$_NewsState(
      latestArticles: null == latestArticles
          ? _value._latestArticles
          : latestArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      featuredArticles: null == featuredArticles
          ? _value._featuredArticles
          : featuredArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      detailedArticle: freezed == detailedArticle
          ? _value.detailedArticle
          : detailedArticle // ignore: cast_nullable_to_non_nullable
              as Article?,
      articlesLoadingState: null == articlesLoadingState
          ? _value.articlesLoadingState
          : articlesLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      singleArticleLoadingState: null == singleArticleLoadingState
          ? _value.singleArticleLoadingState
          : singleArticleLoadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
    ));
  }
}

/// @nodoc

class _$_NewsState implements _NewsState {
  const _$_NewsState(
      {final List<Article> latestArticles = const [],
      final List<Article> featuredArticles = const [],
      this.detailedArticle,
      this.articlesLoadingState = LoadingState.init,
      this.singleArticleLoadingState = LoadingState.init})
      : _latestArticles = latestArticles,
        _featuredArticles = featuredArticles;

  final List<Article> _latestArticles;
  @override
  @JsonKey()
  List<Article> get latestArticles {
    if (_latestArticles is EqualUnmodifiableListView) return _latestArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestArticles);
  }

  final List<Article> _featuredArticles;
  @override
  @JsonKey()
  List<Article> get featuredArticles {
    if (_featuredArticles is EqualUnmodifiableListView)
      return _featuredArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredArticles);
  }

  @override
  final Article? detailedArticle;
  @override
  @JsonKey()
  final LoadingState articlesLoadingState;
  @override
  @JsonKey()
  final LoadingState singleArticleLoadingState;

  @override
  String toString() {
    return 'NewsState(latestArticles: $latestArticles, featuredArticles: $featuredArticles, detailedArticle: $detailedArticle, articlesLoadingState: $articlesLoadingState, singleArticleLoadingState: $singleArticleLoadingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            const DeepCollectionEquality()
                .equals(other._latestArticles, _latestArticles) &&
            const DeepCollectionEquality()
                .equals(other._featuredArticles, _featuredArticles) &&
            (identical(other.detailedArticle, detailedArticle) ||
                other.detailedArticle == detailedArticle) &&
            (identical(other.articlesLoadingState, articlesLoadingState) ||
                other.articlesLoadingState == articlesLoadingState) &&
            (identical(other.singleArticleLoadingState,
                    singleArticleLoadingState) ||
                other.singleArticleLoadingState == singleArticleLoadingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_latestArticles),
      const DeepCollectionEquality().hash(_featuredArticles),
      detailedArticle,
      articlesLoadingState,
      singleArticleLoadingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {final List<Article> latestArticles,
      final List<Article> featuredArticles,
      final Article? detailedArticle,
      final LoadingState articlesLoadingState,
      final LoadingState singleArticleLoadingState}) = _$_NewsState;

  @override
  List<Article> get latestArticles;
  @override
  List<Article> get featuredArticles;
  @override
  Article? get detailedArticle;
  @override
  LoadingState get articlesLoadingState;
  @override
  LoadingState get singleArticleLoadingState;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
