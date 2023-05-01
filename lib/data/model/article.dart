import 'dart:io';
import 'package:html/parser.dart';

import 'package:http/http.dart' as http;

class Article {
  final String id;
  final String title;
  final String description;
  final DateTime publicationDate;
  final String imageUrl;
  String? _realImageUrl;
  final bool isReaded;
  final bool isFeatured;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.publicationDate,
    required this.imageUrl,
    this.isReaded = false,
    required this.isFeatured,
  });

  Article copyWith({
    final bool? isReaded,
  }) {
    return Article(
      id: id,
      title: title,
      description: description,
      publicationDate: publicationDate,
      imageUrl: imageUrl,
      isReaded: isReaded ?? this.isReaded,
      isFeatured: isFeatured,
    );
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      publicationDate: json['publicationDate'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'],
    );
  }

  /// Image URL parser as links in given models lead to a page, not to an image
  Future<String?> get realImageUrl async {
    if (_realImageUrl != null) {
      return _realImageUrl;
    }

    var response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode != HttpStatus.ok) {
      return null;
    }

    var pageHtml = parse(response.body);
    var link = pageHtml.querySelector('link[rel="image_src"]');
    _realImageUrl = link!.attributes['href'];
    return _realImageUrl;
  }
}
