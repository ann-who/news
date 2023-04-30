import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/app_theme.dart';

import 'package:news_app/data/repository/mock_news_repository_impl.dart';
import 'package:news_app/presentation/all_news_page/all_news_page.dart';
import 'package:news_app/presentation/article_details_page/article_details_page.dart';
import 'package:news_app/presentation/bloc/news_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MockNewsRepository(),
      child: BlocProvider(
        create: (context) => NewsBloc(
          newsRepository: RepositoryProvider.of<MockNewsRepository>(context),
        )
          ..add(FeaturedArticlesLoaded())
          ..add(LatestArticlesLoaded()),
        child: MaterialApp(
          title: 'QtimNews',
          theme: AppTheme.theme(),
          home: const AllNewsPage(),
          onGenerateRoute: _onGenerateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    if (settings.name == ArticleDetailsPage.routeName) {
      // Could pass Article but in task description it was
      // specified to get an article by id ondetailed screen
      final articleId = settings.arguments as String;

      return MaterialPageRoute(
        builder: (context) {
          return ArticleDetailsPage(articleId: articleId);
        },
      );
    }

    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}
