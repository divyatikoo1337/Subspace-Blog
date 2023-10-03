import 'package:blog/models/Blog.dart';
import 'package:flutter/material.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                blog.heading,
                style: TextStyle(fontSize: 30),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
