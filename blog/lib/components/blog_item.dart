import 'package:blog/models/Blog.dart';
import 'package:blog/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    const icon = Icon(Icons.favorite_border);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 260,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(blog.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 310,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    blog.heading,
                    style: TextStyle(fontSize: 30),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.toggleFavorites(blog);
                  },
                  icon: provider.isExist(blog)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
