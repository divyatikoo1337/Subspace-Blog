import 'package:blog/models/Blog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Blog> _favorites = [];
  List<Blog> get favorites => _favorites;

  void toggleFavorites(Blog blog) {
    final isExist = _favorites.contains(blog);
    if (isExist) {
      _favorites.remove(blog);
    } else {
      _favorites.add(blog);
    }
    notifyListeners();
  }

  bool isExist(Blog blog) {
    final _isExist = _favorites.contains(blog);
    return _isExist;
  }
}
