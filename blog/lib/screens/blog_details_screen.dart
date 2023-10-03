import 'package:blog/models/Blog.dart';
import 'package:blog/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BlogDetailsScreen extends StatelessWidget {
  BlogDetailsScreen({super.key, required this.blog, required this.index});

  final Blog blog;
  int index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).backgroundColor,
        title: Text('Story ${index + 1}'),
        actions: [
          IconButton(
            onPressed: () {
              provider.toggleFavorites(blog);
            },
            icon: provider.isExist(blog)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Text(
                  blog.heading,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 300,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(blog.url),
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Description',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  blog.description,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
